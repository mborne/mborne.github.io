#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

# Ubuntu 24.04 cloud image
VM_IMAGE_URL="https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "${ICON_ERROR} Should not be run as root (don't use sudo)";
    exit 1;
fi

#----------------------------------------------------------------------
# Handle parameters
#----------------------------------------------------------------------

VM_NAME=${VM_NAME:-"ubuntu-server"}
VM_RAM="${VM_RAM:-2048}"  # in MB
VM_VCPUS="${VM_VCPUS:-2}"
VM_DISK_SIZE="${VM_DISK_SIZE:-20G}"  # in GB
UBUNTU_PASSWORD=${UBUNTU_PASSWORD:-"ChangeIt"}

echo "${ICON_INFO} VM Configuration (overridable via environment variables) :"
echo "- VM_NAME: $VM_NAME"
echo "- VM_RAM: $VM_RAM MB"
echo "- VM_VCPUS: $VM_VCPUS GB"
echo "- VM_DISK_SIZE: $VM_DISK_SIZE GB"
echo "- UBUNTU_PASSWORD: (hidden)"

#----------------------------------------------------------------------
# Check and install required tools
#----------------------------------------------------------------------

echo "${ICON_INFO} Verifying required tools are installed..."

genisoimage --version &> /dev/null || {
    echo "${ICON_INFO} Installing genisoimage for cloud-init ISO creation..."
    sudo apt-get update
    sudo apt-get install -y genisoimage
}

# check mkpasswd for password hashing
mkpasswd --version &> /dev/null || {
    echo "${ICON_INFO} Installing whois package for mkpasswd ..."
    sudo apt-get update
    sudo apt-get install -y whois
}

LIBVIRT_DATA_DIR="/var/lib/libvirt"
DISKS_DIR="${LIBVIRT_DATA_DIR}/disks"


echo "${ICON_INFO} Checking if VM $VM_NAME already exists ..."
if virsh dominfo "$VM_NAME" &> /dev/null; then
    echo "${ICON_ERROR} VM $VM_NAME already exists. Aborting."
    exit 1
fi

echo "${ICON_INFO} Creating KVM data directory at $DISKS_DIR ..."
sudo mkdir -p "$DISKS_DIR" && sudo chown -R $USER:kvm "$DISKS_DIR"

#----------------------------------------------------------------------
# Ensure base image is downloaded
#----------------------------------------------------------------------

echo "${ICON_INFO} Downloading base image..."
BASE_IMAGE_PATH="$DISKS_DIR/noble-server-cloudimg-amd64.img"
if [ ! -f "$BASE_IMAGE_PATH" ]; then
    wget -O "$BASE_IMAGE_PATH" "$VM_IMAGE_URL" || {
        echo "${ICON_ERROR} Failed to download VM image from $VM_IMAGE_URL"
        exit 1
    }
else
    echo "${ICON_INFO} VM image already exists at $BASE_IMAGE_PATH, skipping download."
fi

#----------------------------------------------------------------------
# Create VM disk by cloning and resizing the base image
#----------------------------------------------------------------------

VM_IMAGE_PATH="$DISKS_DIR/$VM_NAME.os.qcow2"
echo "${ICON_INFO} Creating VM disk for $VM_NAME at $VM_IMAGE_PATH ..."
qemu-img create -f qcow2 -F qcow2 -b "$BASE_IMAGE_PATH" "$VM_IMAGE_PATH" "$VM_DISK_SIZE" || {
    echo "${ICON_ERROR} Failed to create VM disk at $VM_IMAGE_PATH"
    exit 1
}

#----------------------------------------------------------------------
# Create cloudinit ISO for VM customization
#----------------------------------------------------------------------

echo "${ICON_INFO} Creating cloud-init ISO for VM customization ..."

CLOUDINIT_ISO_PATH="${DISKS_DIR}/${VM_NAME}.cloudinit.iso"

TEMP_DIR=$(mktemp -d)
echo "${ICON_INFO} Using temporary directory ${TEMP_DIR} for cloud-init files ..."

# Set default password for ubuntu user
UBUNTU_PASSWORD_HASH=$(echo $UBUNTU_PASSWORD | mkpasswd -m sha-512 -s)

# Create cloud-init user-data
USER_DATA_PATH="${TEMP_DIR}/user-data"
cat > "${USER_DATA_PATH}" <<EOF
#cloud-config
hostname: ${VM_NAME}
manage_etc_hosts: true

users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    home: /home/ubuntu
    shell: /bin/bash
    lock_passwd: false
    passwd: "${UBUNTU_PASSWORD_HASH}"
    chpasswd: { expire: False }

autoinstall:
    version: 1
    identity:
        hostname: ${VM_NAME}
        username: ubuntu
        password: "${UBUNTU_PASSWORD_HASH}"
    refresh-installer:
        update: yes

package_update: true
packages:
  - curl
  - htop
runcmd:
  - echo "✅ Cloud-init terminé !" > /home/ubuntu/ready.txt
EOF


NETWORK_CONFIG_PATH="${TEMP_DIR}/network-config"
cat > "${NETWORK_CONFIG_PATH}" <<EOF
version: 2
renderer: networkd
ethernets:
  # NAT network interface (virbr0)
  enp1s0:
      dhcp4: yes
      dhcp6: no
EOF

# Create cloud-init meta-data
META_DATA_PATH="${TEMP_DIR}/meta-data"
cat > "${META_DATA_PATH}" <<EOF
instance-id: $(uuidgen || echo i-abcdefg)
local-hostname: ${VM_NAME}
EOF

echo "${ICON_INFO} Creating cloud-init ISO at ${CLOUDINIT_ISO_PATH} ..."
genisoimage -output "${TEMP_DIR}/cloudinit.iso" -volid cidata -joliet -rock "${USER_DATA_PATH}" "${META_DATA_PATH}" "${NETWORK_CONFIG_PATH}"

cp "${TEMP_DIR}/cloudinit.iso" "${CLOUDINIT_ISO_PATH}"

echo "${ICON_INFO} Cleaning up temporary files ..."
rm -rf "${TEMP_DIR}"
echo "${ICON_INFO} Cloud-init ISO created at ${CLOUDINIT_ISO_PATH}"


#----------------------------------------------------------------------
# Launch the VM
#----------------------------------------------------------------------

echo "${ICON_INFO} Launching VM $VM_NAME ..."
virt-install \
    --name "$VM_NAME" \
    --ram "$VM_RAM" \
    --vcpus "$VM_VCPUS" \
    --disk "path=${VM_IMAGE_PATH},device=disk,bus=virtio,format=qcow2" \
    --disk "path=${CLOUDINIT_ISO_PATH},device=cdrom" \
    --virt-type kvm \
    --osinfo ubuntu24.04 \
    --network network=default \
    --graphics none \
    --console pty,target_type=serial \
    --import \
    --noautoconsole || {
        echo "${ICON_ERROR} Failed to create and start VM $VM_NAME"
        exit 1
    }


echo "${ICON_OK} VM $VM_NAME created and started successfully!"
virsh list --all

echo "${ICON_INFO} You can connect to the VM console using 'virsh console $VM_NAME'"


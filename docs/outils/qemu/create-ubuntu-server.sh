#!/bin/bash

set -euo pipefail

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

# Ubuntu 24.04 cloud image
VM_IMAGE_URL="https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "${ICON_ERROR} Should not be run as root (don't use sudo)"
    exit 1
fi

#----------------------------------------------------------------------
# Handle parameters
#----------------------------------------------------------------------

QEMU_DIR=${QEMU_DIR:-$HOME/qemu}
VM_NAME=${VM_NAME:-ubuntu-server}
VM_RAM=${VM_RAM:-2048}            # in MB
VM_VCPUS=${VM_VCPUS:-2}
VM_DISK_SIZE=${VM_DISK_SIZE:-20G}
VM_SSH_PORT=${VM_SSH_PORT:-2222}  # host port forwarded to the VM SSH port
UBUNTU_PASSWORD=${UBUNTU_PASSWORD:-ChangeIt}

VM_DIR="$QEMU_DIR/$VM_NAME"
BASE_IMAGE_PATH="$QEMU_DIR/images/noble-server-cloudimg-amd64.img"

echo "${ICON_INFO} VM Configuration (overridable via environment variables) :"
echo "- QEMU_DIR: $QEMU_DIR"
echo "- VM_NAME: $VM_NAME"
echo "- VM_RAM: $VM_RAM MB"
echo "- VM_VCPUS: $VM_VCPUS"
echo "- VM_DISK_SIZE: $VM_DISK_SIZE"
echo "- VM_SSH_PORT: $VM_SSH_PORT"
echo "- UBUNTU_PASSWORD: (hidden)"

if [ -e "$VM_DIR/disk.qcow2" ]; then
    echo "${ICON_ERROR} $VM_DIR/disk.qcow2 already exists. Aborting."
    exit 1
fi

#----------------------------------------------------------------------
# Check and install required tools
#----------------------------------------------------------------------

echo "${ICON_INFO} Verifying required tools are installed..."

command -v qemu-system-x86_64 &> /dev/null || {
    echo "${ICON_INFO} Installing qemu-system-x86 (qemu-system-x86_64) ..."
    sudo apt-get update
    sudo apt-get install -y qemu-system-x86
}

command -v qemu-img &> /dev/null || {
    echo "${ICON_INFO} Installing qemu-utils (qemu-img) ..."
    sudo apt-get update
    sudo apt-get install -y qemu-utils
}

# cloud-localds to generate cloud-init disk
command -v cloud-localds &> /dev/null || {
    echo "${ICON_INFO} Installing cloud-image-utils (cloud-localds) for cloud-init seed creation..."
    sudo apt-get update
    sudo apt-get install -y cloud-image-utils
}

# mkpasswd for password hashing
command -v mkpasswd &> /dev/null || {
    echo "${ICON_INFO} Installing whois package for mkpasswd ..."
    sudo apt-get update
    sudo apt-get install -y whois
}

#----------------------------------------------------------------------
# Ensure base image is downloaded
#----------------------------------------------------------------------

mkdir -p "$QEMU_DIR/images" "$VM_DIR"

if [ ! -f "$BASE_IMAGE_PATH" ]; then
    echo "${ICON_INFO} Downloading base image to $BASE_IMAGE_PATH ..."
    wget -O "$BASE_IMAGE_PATH.tmp" "$VM_IMAGE_URL"
    mv "$BASE_IMAGE_PATH.tmp" "$BASE_IMAGE_PATH"
else
    echo "${ICON_INFO} Base image already exists at $BASE_IMAGE_PATH, skipping download."
fi

#----------------------------------------------------------------------
# Create VM disk based on the base image (backing file) and resize it
#----------------------------------------------------------------------

echo "${ICON_INFO} Creating VM disk $VM_DIR/disk.qcow2 ($VM_DISK_SIZE) ..."
qemu-img create -f qcow2 -F qcow2 -b "$BASE_IMAGE_PATH" "$VM_DIR/disk.qcow2" "$VM_DISK_SIZE"

#----------------------------------------------------------------------
# Generate cloud-init seed
#----------------------------------------------------------------------

echo "${ICON_INFO} Creating cloud-init seed $VM_DIR/seed.img ..."

UBUNTU_PASSWORD_HASH=$(echo "$UBUNTU_PASSWORD" | mkpasswd -m sha-512 -s)

cat > "$VM_DIR/meta-data" <<EOF
instance-id: $(uuidgen 2>/dev/null || echo "i-$VM_NAME")
local-hostname: ${VM_NAME}
EOF

cat > "$VM_DIR/user-data" <<EOF
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

ssh_pwauth: true

package_update: true
packages:
  - curl
  - htop
runcmd:
  - echo "✅ Cloud-init terminé !" > /home/ubuntu/ready.txt
EOF

cloud-localds "$VM_DIR/seed.img" "$VM_DIR/user-data" "$VM_DIR/meta-data"

#----------------------------------------------------------------------
# Generate start script
#----------------------------------------------------------------------

cat > "$VM_DIR/start.sh" <<EOF
#!/bin/bash

# Start VM ${VM_NAME} with the serial console in the terminal (Ctrl-a x to quit QEMU)
cd "\$(dirname "\$0")"

# KVM acceleration if /dev/kvm is usable, emulation (TCG) otherwise
if [ -r /dev/kvm ] && [ -w /dev/kvm ]; then
    ACCEL_OPTS="-accel kvm -cpu host"
else
    echo "⚠️ /dev/kvm is not usable, falling back to emulation (slow)"
    ACCEL_OPTS="-accel tcg -cpu max"
fi

exec qemu-system-x86_64 \\
  -name ${VM_NAME} \\
  -machine q35 \\
  \$ACCEL_OPTS \\
  -smp ${VM_VCPUS} \\
  -m ${VM_RAM} \\
  -drive if=virtio,format=qcow2,file=disk.qcow2 \\
  -drive if=virtio,format=raw,file=seed.img \\
  -nic user,model=virtio,hostfwd=tcp:127.0.0.1:${VM_SSH_PORT}-:22 \\
  -nographic \\
  "\$@"
EOF
chmod +x "$VM_DIR/start.sh"

if [ ! -r /dev/kvm ] || [ ! -w /dev/kvm ]; then
    echo "${ICON_WARN} /dev/kvm is not usable : the VM will run without KVM acceleration (see https://mborne.github.io/outils/kvm/)"
fi

echo "${ICON_OK} VM $VM_NAME prepared in $VM_DIR"
echo "${ICON_INFO} Start it with : $VM_DIR/start.sh"
echo "${ICON_INFO} Then connect with : ssh -p $VM_SSH_PORT ubuntu@localhost (or login on the serial console)"

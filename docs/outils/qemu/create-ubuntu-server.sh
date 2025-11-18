#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

QEMU_DIR=${VM_DIR:-$HOME/qemu}
VM_NAME=${VM_NAME:-ubuntu-server}
VM_DIR=$QEMU_DIR/$VM_NAME

if [ -e $VM_DIR ];
then
    echo "${ICON_WARN} $VM_DIR already exists"
fi

# check cloud-localds to generate cloud-init disk
cloud-localds --version &> /dev/null || {
    echo "${ICON_INFO} Installing cloud-image-utils (cloud-localds) cloud-init seed creation..."
    sudo apt-get update
    sudo apt install -y cloud-image-utils
}

# check mkpasswd for password hashing
mkpasswd --version &> /dev/null || {
    echo "${ICON_INFO} Installing whois package for mkpasswd ..."
    sudo apt-get update
    sudo apt-get install -y whois
}


UBUNTU_PASSWORD=${UBUNTU_PASSWORD:-ChangeIt}
UBUNTU_PASSWORD_HASH=$(echo $UBUNTU_PASSWORD | mkpasswd -m sha-512 -s)

mkdir -p $VM_DIR
cd $VM_DIR

# Download OS
wget -nc -O os.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img

# Generate cloudinit config
cat > meta-data <<EOF
#cloud-config
hostname: ubuntu-server
manage_etc_hosts: true
instance-id: $(uuidgen || echo i-abcdefg)
EOF

cat > user-data <<EOF
#cloud-config
hostname: ubuntu-server
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
        hostname: ubuntu-server
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

cloud-localds seed.img user-data meta-data

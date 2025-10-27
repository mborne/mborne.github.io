#!/bin/bash

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Should not be run as root (don't use sudo)";
    exit 1;
fi

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

# check for kvm support
# see https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/
echo "${ICON_INFO} Installing cpu-checker to verify KVM support..."
sudo apt-get update
sudo apt-get install -y cpu-checker

echo "${ICON_INFO} Checking KVM support..."
sudo kvm-ok || { 
    echo "❌ KVM not supported on this machine"; 
    exit 1; 
}

# Install kvm-ok on a Debian/Ubuntu
echo "${ICON_INFO} Installing KVM and libvirt..."
sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# add current user to libvirt
echo "Adding user $USER to libvirt and kvm groups..."
sudo adduser $USER libvirt
sudo adduser $USER kvm

echo "${ICON_OK} KVM Installation complete!"
echo "${ICON_WARN} You may need to log out and log back in for group changes to take effect. Then, 
you can verify the installation with 'virsh list --all'."

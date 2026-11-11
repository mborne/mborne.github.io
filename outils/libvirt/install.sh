#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "${ICON_ERROR} Should not be run as root (don't use sudo)";
    exit 1;
fi

echo "${ICON_INFO} Installing libvirt and virtualization helpers..."
sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst

# add current user to libvirt and kvm groups
echo "Adding user $USER to libvirt and kvm groups..."
sudo adduser "$USER" libvirt
sudo adduser "$USER" kvm

echo "${ICON_OK} libvirt installation complete!"
echo "${ICON_WARN} You may need to log out and log back in for group changes to take effect."
echo "${ICON_WARN} Then, verify with: virsh list --all"

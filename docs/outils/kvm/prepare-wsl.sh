#!/bin/bash

if [ ! -e "/etc/wsl.conf" ];
then
    echo "kvm/prepare-wsl.sh is for WSL2 (/etc/wsl.conf not found)!"
    exit 1
fi

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "${ICON_INFO} Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

echo "${ICON_WARN} Disable snap services..."
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
sudo systemctl mask snapd.service

# kernelCommandLine=amd_iommu=on iommu=pt kvm.ignore_msrs=1 kvm-amd.nested=1 kvm-amd.ept=1 kvm-amd.emulate_invalid_guest_state=0 kvm-amd.enable_shadow_vmcs=1 kvm-amd.enable_apicv=1
# command = /bin/bash -c 'chown -v root:kvm /dev/kvm && chmod 660 /dev/kvm'

echo "${ICON_INFO} Enable nestedVirtualization in /etc/wsl2.conf ..."
echo "
[boot]
systemd=true

[wsl2]
nestedVirtualization=true
" | sudo tee /etc/wsl2.conf

echo "${ICON_WARN} WARNING : reboot required (wsl --shutdown && wsl)"

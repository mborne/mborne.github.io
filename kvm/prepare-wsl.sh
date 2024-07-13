#!/bin/bash

if [ ! -e "/etc/wsl.conf" ];
then
    echo "kvm/prepare-wsl.sh is for WSL2 (/etc/wsl.conf not found)!"
    exit 1
fi

sudo apt-get update
sudo apt-get upgrade -y

sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
sudo systemctl mask snapd.service

echo "
[boot]
systemd=true
kernelCommandLine=amd_iommu=on iommu=pt kvm.ignore_msrs=1 kvm-amd.nested=1 kvm-amd.ept=1 kvm-amd.emulate_invalid_guest_state=0 kvm-amd.enable_shadow_vmcs=1 kvm-amd.enable_apicv=1

[wsl2]
nestedVirtualization=true
" | sudo tee /etc/wsl2.conf

echo "WARNING : reboot required (wsl --shutdown && wsl)"

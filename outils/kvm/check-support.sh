#!/bin/bash

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

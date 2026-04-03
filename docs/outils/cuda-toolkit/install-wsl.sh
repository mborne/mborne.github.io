#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

# Source : https://docs.nvidia.com/cuda/wsl-user-guide/index.html#cuda-support-for-wsl-2

echo "-------------------------------------------------------------------"
echo "-- cuda-toolkit/install-wsl.sh"
echo "-------------------------------------------------------------------"

if [ ! -e "/etc/wsl.conf" ];
then
    echo "${ICON_ERROR} cuda-toolkit/install-wsl.sh is for WSL2 (/etc/wsl.conf not found)!"
    exit 1
fi

if ! grep -q "WSL2" /etc/wsl.conf;
then
    echo "${ICON_ERROR} cuda-toolkit/install-wsl.sh is for WSL2 (/etc/wsl.conf does not contain WSL2)!"
    exit 1
fi

if ! command -v wget &> /dev/null
then
    echo "${ICON_INFO} wget is required, installing it (sudo apt-get update && sudo apt-get install -y wget)"
    sudo apt-get update && sudo apt-get install -y wget
fi

echo "${ICON_INFO} Removing old nvidia keyring if exists ..."
sudo apt-key del 7fa2af80

# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600

cd /tmp
wget https://developer.download.nvidia.com/compute/cuda/12.5.0/local_installers/cuda-repo-wsl-ubuntu-12-5-local_12.5.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-12-5-local_12.5.0-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-12-5-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-5

echo "${ICON_OK} CUDA Toolkit 12.5 installation completed successfully!"

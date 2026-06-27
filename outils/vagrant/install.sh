#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- vagrant/install.sh"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Ensure that wget and gnupg are installed..."
sudo apt-get update
sudo apt-get install -y wget gnupg

echo "${ICON_INFO} Adding HashiCorp GPG key ..."
if [ ! -e "/usr/share/keyrings/hashicorp-archive-keyring.gpg" ];
then
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
fi

echo "${ICON_INFO} Adding HashiCorp repository ( /etc/apt/sources.list.d/hashicorp.list ) ..."
if [ ! -e "/etc/apt/sources.list.d/hashicorp.list" ];
then
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi

echo "${ICON_INFO} Installing Vagrant ..."
sudo apt-get update
sudo apt-get install -y vagrant

echo "${ICON_OK} Vagrant installation completed, displaying version: $(vagrant --version)"

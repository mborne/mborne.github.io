#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- ansible/install.sh"
echo "-------------------------------------------------------------------"

# ensure the script is not run as root
if [ "$EUID" -eq 0 ]; then
  echo "${ICON_ERROR} Please do not run this script as root. Use sudo when prompted."
  exit 1
fi

echo "${ICON_INFO} Add Ansible PPA ..."
sudo apt-get install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "${ICON_INFO} Install Ansible and python pip ..."
sudo apt-get install -y python3-pip ansible

# required to use {{ registry_admin_password | password_hash('bcrypt') }}
echo "${ICON_OK} Install passlib to allow password_hash filter in Ansible ..."
pip3 install passlib --user

echo "${ICON_OK} Ansible installation completed."



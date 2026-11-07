#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "#------------------------------------------------------------"
echo "# ansible/create-venv.sh"
echo "#------------------------------------------------------------"

# ensure that the script is not run as root
if [ "$EUID" -eq 0 ]; then
    echo "${ICON_ERROR} Please do not run this script as root (sudo), it will create a virtual environment in the current user's home directory."
    exit 1
fi

ANSIBLE_VENV_DIR=${ANSIBLE_VENV_DIR:-~/ansible-venv}
echo "${ICON_INFO} ANSIBLE_VENV_DIR=${ANSIBLE_VENV_DIR}"

#----------------------------------------------------
# installation des pré-requis à la création de venv
#----------------------------------------------------
echo "${ICON_INFO} Installing prerequisites for creating virtual environment ..."
sudo apt-get update
sudo apt-get install -y python3-venv

echo "${ICON_INFO} Creating virtual environment at ${ANSIBLE_VENV_DIR} ..."
python3 -m venv "$ANSIBLE_VENV_DIR"

echo "${ICON_INFO} Activating virtual environment at ${ANSIBLE_VENV_DIR} ..."
source "${ANSIBLE_VENV_DIR}/bin/activate"

# installation des dépendances
echo "${ICON_INFO} Installing dependencies and common packages in virtual environment ..."
pip3 install setuptools-rust
pip3 install --upgrade pip

# required to use {{ registry_admin_password | password_hash('bcrypt') }}
pip3 install passlib

# installation de ansible
echo "${ICON_INFO} Installing Ansible in virtual environment ..."
pip3 install ansible

echo "${ICON_INFO} Displaying ansible version :"
ansible --version

echo "${ICON_INFO} Usage for ansible virtual environment :"
echo "source \"${ANSIBLE_VENV_DIR}/bin/activate\""
echo "ansible --version"
echo "#... do something with ansible ..."
echo "deactivate"

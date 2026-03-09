#!/bin/bash

ANSIBLE_VENV_DIR=${ANSIBLE_VENV_DIR:-~/ansible-venv}

echo "#------------------------------------------------------------"
echo "# ansible/create-venv.sh :"
echo "#  - ANSIBLE_VENV_DIR=$ANSIBLE_VENV_DIR"
echo "#------------------------------------------------------------"

#----------------------------------------------------
# installation des pré-requis à la création de venv
#----------------------------------------------------
sudo apt-get update
sudo apt-get install -y python3-venv

python3 -m venv "$ANSIBLE_VENV_DIR"

# activation du venv
source "${ANSIBLE_VENV_DIR}/bin/activate"

# installation des dépendances
pip3 install setuptools-rust
pip3 install --upgrade pip

# required to use {{ registry_admin_password | password_hash('bcrypt') }}
pip3 install passlib

# installation de ansible
pip3 install ansible

# contrôle de la version
ansible --version

echo "#------------------------------------------------------------"
echo "# Usage :"
echo "#------------------------------------------------------------"
echo "source \"${ANSIBLE_VENV_DIR}/bin/activate\""
echo "ansible --version"
echo "#... do something with ansible ..."
echo "deactivate"

#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y python3-pip ansible

# required to use {{ registry_admin_password | password_hash('bcrypt') }}
pip3 install passlib --user



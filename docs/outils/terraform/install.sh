#!/bin/bash

if [ ! -e "/usr/share/keyrings/hashicorp-archive-keyring.gpg" ];
then
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
fi

if [ ! -e "/etc/apt/sources.list.d/hashicorp.list" ];
then
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi

sudo apt-get update
sudo apt-get install -y terraform


#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=$(dirname "$SCRIPT_DIR")

if [ ! -e "/etc/apt/sources.list.d/hashicorp.list" ];
then
    bash "${ROOT_DIR}/hashicorp/add-repository.sh"
fi

sudo apt-get update
sudo apt-get install -y vagrant


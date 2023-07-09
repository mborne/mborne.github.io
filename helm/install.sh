#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be run as root (use sudo)"
    exit
fi

curl -fsSL -o /tmp/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
bash /tmp/get_helm.sh


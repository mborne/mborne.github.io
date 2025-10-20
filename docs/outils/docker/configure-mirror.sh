#!/bin/bash

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Should not be run as root (don't use sudo)"
    exit
fi

if [ ! -e /etc/docker/daemon.json ];
then
echo '{
    "registry-mirrors": ["https://mirror.gcr.io"]
}' > /etc/docker/daemon.json
fi

service docker restart



#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ ! -e /etc/docker/daemon.json ];
then
echo '{
    "registry-mirrors": ["https://mirror.gcr.io"]
}' > /etc/docker/daemon.json
fi

service docker restart



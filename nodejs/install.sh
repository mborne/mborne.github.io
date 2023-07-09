#!/bin/bash

# https://github.com/nodesource/distributions#debmanual

VERSION=${VERSION:-18}

echo "-------------------------------------------------------------------"
echo "-- nodejs/install.sh - $VERSION ..."
echo "-------------------------------------------------------------------"

KEYRING=/usr/share/keyrings/nodesource.gpg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | sudo tee "$KEYRING" >/dev/null
sudo chmod a+r /usr/share/keyrings/nodesource.gpg

DISTRO="$(lsb_release -s -c)"
echo "deb [signed-by=$KEYRING] https://deb.nodesource.com/node_${VERSION}.x $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src [signed-by=$KEYRING] https://deb.nodesource.com/node_${VERSION}.x $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list

sudo apt-get update
sudo apt-get install -y nodejs

echo "-------------------------------------------------------------------"
echo "-- node : $(node --version)"
echo "-- npm : $(npm --version)"
echo "-------------------------------------------------------------------"

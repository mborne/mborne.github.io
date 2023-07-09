#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be run as root (use sudo)"
    exit
fi

VERSION=${VERSION:-1.4.4}
LAST_VERSION=$(curl --silent "https://api.github.com/repos/FiloSottile/mkcert/releases/latest" | jq -r .tag_name)

echo "-------------------------------------------------------------------"
echo "-- install-mkcert.sh - v$VERSION (latest=${LAST_VERSION})"
echo "-------------------------------------------------------------------"

ARCH=$(dpkg --print-architecture)
URL=https://github.com/FiloSottile/mkcert/releases/download/v${VERSION}/mkcert-v${VERSION}-linux-${ARCH}
wget -O /usr/local/bin/mkcert $URL
chmod +x /usr/local/bin/mkcert

# Pour permettre la configuration du navigateur :
# TRUST_STORES=nss mkcert -install
apt-get update
apt-get install -y libnss3-tools


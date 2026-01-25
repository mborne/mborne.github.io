#!/bin/bash

VERSION=${VERSION:-1.4.4}
LAST_VERSION=$(curl --silent "https://api.github.com/repos/FiloSottile/mkcert/releases/latest" | jq -r .tag_name)

echo "-------------------------------------------------------------------"
echo "-- install-mkcert.sh - v$VERSION (latest=${LAST_VERSION})"
echo "-------------------------------------------------------------------"

ARCH=$(dpkg --print-architecture)
URL=https://github.com/FiloSottile/mkcert/releases/download/v${VERSION}/mkcert-v${VERSION}-linux-${ARCH}
wget -qO /tmp/mkcert $URL
chmod +x /tmp/mkcert
sudo rm -rf /usr/local/bin/mkcert
sudo mv /tmp/mkcert /usr/local/bin/.

# Pour permettre la configuration du navigateur :
# TRUST_STORES=nss mkcert -install
sudo apt-get update
sudo apt-get install -y libnss3-tools

mkcert --version
mkcert --help

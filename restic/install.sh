#!/bin/bash

LAST_VERSION=$(curl --silent "https://api.github.com/repos/restic/restic/releases/latest" | jq -r .tag_name)
VERSION=${VERSION:-0.16.5}

echo "-------------------------------------------------------------------"
echo "-- restic/install.sh - v$VERSION (latest=${LAST_VERSION})"
echo "-------------------------------------------------------------------"

ARCH=$(dpkg --print-architecture)
URL=https://github.com/restic/restic/releases/download/v${VERSION}/restic_${VERSION}_linux_${ARCH}.bz2

echo "download $URL to /tmp/restic.bz2..."
wget -qO /tmp/restic.bz2 $URL

echo "extract /tmp/restic.bz2 to /usr/local/bin/restic..."
bzip2 -d /tmp/restic.bz2
chmod +x /tmp/restic
sudo rm -rf /usr/local/bin/restic
sudo mv /tmp/restic /usr/local/bin/.

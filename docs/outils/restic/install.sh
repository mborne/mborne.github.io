#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

VERSION=${VERSION:-0.16.5}

echo "-------------------------------------------------------------------"
echo "-- restic/install.sh - v$VERSION"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Ensure that curl and jq are installed..."
sudo apt-get update
sudo apt-get install -y curl jq

echo "${ICON_INFO} Retrieving the latest version of restic from GitHub releases..."
LAST_VERSION=$(curl --silent "https://api.github.com/repos/restic/restic/releases/latest" | jq -r .tag_name)

if [ "$VERSION" != "$LAST_VERSION" ]; then
  echo "${ICON_WARN} Installing restic v$VERSION but a newer version of restic is available: $LAST_VERSION."
else
  echo "${ICON_OK} $VERSION is the latest version of restic."
fi

ARCH=$(dpkg --print-architecture)
URL=https://github.com/restic/restic/releases/download/v${VERSION}/restic_${VERSION}_linux_${ARCH}.bz2

echo "${ICON_INFO} Downloading $URL to /tmp/restic.bz2..."
wget -qO /tmp/restic.bz2 $URL

echo "${ICON_INFO} Extracting /tmp/restic.bz2 to /usr/local/bin/restic..."
bzip2 -d /tmp/restic.bz2
chmod +x /tmp/restic
sudo rm -rf /usr/local/bin/restic
sudo mv /tmp/restic /usr/local/bin/.

echo "${ICON_OK} restic v$VERSION installed successfully, displaying version :"
echo "${ICON_INFO} $(restic version)"

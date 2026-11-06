#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "jq is required (sudo apt-get update && sudo apt-get install -y jq)"
    exit 1
fi

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    TARGET_ARCH="amd64"
elif [ "$ARCH" = "aarch64" ]; then
    TARGET_ARCH="arm64"
else
    echo "Unsupported architecture: $ARCH (supported: x86_64, aarch64)"
    exit 1
fi

LAST_VERSION=$(curl --silent "https://api.github.com/repos/anchore/syft/releases/latest" | jq -r .tag_name)
VERSION=1.57.0
DEB=syft_${VERSION}_linux_${TARGET_ARCH}.deb
URL=https://github.com/anchore/syft/releases/download/v${VERSION}/${DEB}

echo "-------------------------------------------------------------------"
echo "-- syft/install.sh - v$VERSION (latest=$LAST_VERSION)"
echo "-------------------------------------------------------------------"

wget -nc -qO /tmp/${DEB} $URL
sudo dpkg -i /tmp/${DEB}

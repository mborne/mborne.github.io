#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "jq is required (sudo apt-get update && sudo apt-get install -y jq)"
    exit 1
fi

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    TARGET_ARCH="x64"
elif [ "$ARCH" = "aarch64" ]; then
    TARGET_ARCH="arm64"
else
    echo "Unsupported architecture: $ARCH (supported: x86_64, aarch64)"
    exit 1
fi

LAST_VERSION=$(curl --silent "https://api.github.com/repos/gitleaks/gitleaks/releases/latest" | jq -r .tag_name)
VERSION=8.30.1
URL=https://github.com/gitleaks/gitleaks/releases/download/v${VERSION}/gitleaks_${VERSION}_linux_${TARGET_ARCH}.tar.gz

echo "-------------------------------------------------------------------"
echo "-- gitleaks/install.sh - v$VERSION (latest=$LAST_VERSION)"
echo "-------------------------------------------------------------------"

wget -nc -qO /tmp/gitleaks_${VERSION}_linux_${TARGET_ARCH}.tar.gz $URL
sudo tar -xzf /tmp/gitleaks_${VERSION}_linux_${TARGET_ARCH}.tar.gz -C /usr/local/bin gitleaks
sudo chmod +x /usr/local/bin/gitleaks

#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

VERSION=${VERSION:-0.31.0}

echo "-------------------------------------------------------------------"
echo "-- kind/install.sh - v$VERSION"
echo "-------------------------------------------------------------------"

if ! command -v curl &> /dev/null
then
    echo "${ICON_INFO} curl is required, installing it (sudo apt-get update && sudo apt-get install -y curl)"
    sudo apt-get update && sudo apt-get install -y curl
fi

if ! command -v jq &> /dev/null
then
    echo "${ICON_INFO}jq is required, installing it (sudo apt-get update && sudo apt-get install -y jq)"
    sudo apt-get update && sudo apt-get install -y jq   
fi

# Ensure that the last version of kind is installed
LAST_VERSION=$(curl --silent "https://api.github.com/repos/kubernetes-sigs/kind/releases/latest" | jq -r .tag_name)
if [ "v$VERSION" != "$LAST_VERSION" ]; then
    echo "${ICON_WARN} A newer version of kind is available: $LAST_VERSION (current: $VERSION)"
else
    echo "${ICON_OK} You are using the latest version of kind: $VERSION"
fi


echo "${ICON_INFO} Downloading kind v$VERSION to /usr/local/bin/kind ..."

# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -sLo /tmp/kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -sLo /tmp/kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-arm64

chmod +x /tmp/kind
sudo cp /tmp/kind /usr/local/bin/.
echo "${ICON_INFO} kind v$VERSION has been installed to /usr/local/bin/kind : $(kind --version)"

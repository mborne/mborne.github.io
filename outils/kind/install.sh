#!/bin/bash

if ! command -v curl &> /dev/null
then
    echo "curl is required (sudo apt-get update && sudo apt-get install -y curl)"
    exit 1
fi

if ! command -v jq &> /dev/null
then
    echo "jq is required (sudo apt-get update && sudo apt-get install -y jq)"
    exit 1
fi

VERSION=${VERSION:-0.30.0}
LAST_VERSION=$(curl --silent "https://api.github.com/repos/kubernetes-sigs/kind/releases/latest" | jq -r .tag_name)

echo "-------------------------------------------------------------------"
echo "-- kind/install.sh - v$VERSION (latest=${LAST_VERSION})"
echo "-------------------------------------------------------------------"

# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo /tmp/kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo /tmp/kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-arm64

chmod +x /tmp/kind
sudo cp /tmp/kind /usr/local/bin/.
kind --version

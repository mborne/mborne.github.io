#!/bin/bash

VERSION=${VERSION:-0.29.0}

echo "-------------------------------------------------------------------"
echo "-- kind/install.sh - $VERSION ..."
echo "-------------------------------------------------------------------"

# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo /tmp/kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo /tmp/kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-arm64

chmod +x /tmp/kind
sudo cp /tmp/kind /usr/local/bin/.

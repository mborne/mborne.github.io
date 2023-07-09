#!/bin/bash

VERSION=${VERSION:-0.20.0}

echo "-------------------------------------------------------------------"
echo "-- kind/install.sh - $VERSION ..."
echo "-------------------------------------------------------------------"

curl -Lo /tmp/kind https://kind.sigs.k8s.io/dl/v${VERSION}/kind-linux-amd64
chmod +x /tmp/kind
sudo cp /tmp/kind /usr/local/bin/.

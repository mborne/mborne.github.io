#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

VERSION=${VERSION:-1.26.1}

# ensure architecture is supported
if [[ "$(uname -m)" != "x86_64" ]]; then
  echo "This script supports only x86_64 architecture (current: $(uname -m))."
  exit 1
fi

echo "-------------------------------------------------------------------"
echo "-- go/install.sh (version=${VERSION})"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Ensure wget and tar are installed..."
sudo apt-get update && sudo apt-get install -y wget tar

echo "${ICON_INFO} Installing Go ${VERSION}..."
wget -O /tmp/go.tar.gz "https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf /tmp/go.tar.gz

echo "${ICON_OK} Go ${VERSION} has been installed successfully."
echo "${ICON_INFO} Please add the following line to ~/.profile or your shell profile (e.g., ~/.bashrc or ~/.zshrc) to include Go in your PATH:"
echo "export PATH=\$PATH:/usr/local/go/bin"

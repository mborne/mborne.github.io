#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- dbeaver/install.sh"
echo "-------------------------------------------------------------------"

# ensure arch is amd64
if [[ "$(uname -m)" != "x86_64" ]]; then
    echo "${ICON_ERROR} DBeaver installation is only supported on amd64 architecture (current: $(uname -m))"
    exit 1
fi

# ensure wget is installed
if ! command -v wget &> /dev/null
then
    echo "${ICON_INFO} wget is required, installing it (sudo apt-get update && sudo apt-get install -y wget)"
    sudo apt-get update && sudo apt-get install -y wget
fi

echo -e "${ICON_INFO} Downloading latest DBeaver version..."

wget -O /tmp/dbeaver-ce_latest_amd64.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i /tmp/dbeaver-ce_latest_amd64.deb

echo -e "${ICON_OK} DBeaver installation completed successfully!"


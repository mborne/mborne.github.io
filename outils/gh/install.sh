#!/bin/bash

# Installation de GitHub CLI (gh) via le dépôt APT officiel
# (voir https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

set -e

if ! command -v wget &> /dev/null
then
    sudo apt-get update && sudo apt-get install -y wget
fi

echo "-------------------------------------------------------------------"
echo "-- gh/install.sh - dépôt APT officiel cli.github.com"
echo "-------------------------------------------------------------------"

sudo mkdir -p -m 755 /etc/apt/keyrings
wget -nv -O /tmp/githubcli-archive-keyring.gpg https://cli.github.com/packages/githubcli-archive-keyring.gpg
sudo install -m 644 /tmp/githubcli-archive-keyring.gpg /etc/apt/keyrings/githubcli-archive-keyring.gpg
rm -f /tmp/githubcli-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt-get update
sudo apt-get install -y gh

gh --version

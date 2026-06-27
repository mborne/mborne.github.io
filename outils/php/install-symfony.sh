#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- php/install-symfony.sh"
echo "-------------------------------------------------------------------"

# ensure that curl is installed
echo "${ICON_INFO} Ensure that curl is installed..."
sudo apt-get update && sudo apt-get install -y curl

# symfony CLI
echo "${ICON_INFO} Installing Symfony CLI..."
curl -sS https://get.symfony.com/cli/installer | bash
sudo mv "$HOME/.symfony5/bin/symfony" /usr/local/bin/.
echo "${ICON_OK} Symfony CLI has been installed, version $(symfony version)"

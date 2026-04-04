#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- php/install-composer.sh"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Ensure that curl is installed..."
sudo apt-get update && sudo apt-get install -y curl

echo "${ICON_INFO} Installing composer at /usr/local/bin/composer..."
curl -s https://getcomposer.org/installer | php
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer
echo "${ICON_OK} Composer has been installed, version $(composer --version)"


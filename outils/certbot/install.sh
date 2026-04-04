#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- certbot/install.sh"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Installing required packages..."
sudo apt-get update
sudo apt-get install -y software-properties-common

echo "${ICON_INFO} Adding Certbot PPA repository..."
sudo apt-add-repository -y ppa:certbot/certbot

echo "${ICON_INFO} Installing Certbot package..."
sudo apt-get update
sudo apt-get install -y certbot

echo "${ICON_OK} Certbot installation completed, version : $(certbot --version)"



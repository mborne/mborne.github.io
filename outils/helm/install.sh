#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- helm/install.sh"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Ensure curl is installed..."
sudo apt-get update && sudo apt-get install -y curl

echo "${ICON_INFO} Installing Helm..."
# Adapted from https://helm.sh/docs/intro/install/#from-script
curl -sS https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sudo bash -

echo "${ICON_OK} Helm has been installed successfully :"
echo "Helm version : $(helm version --short)"

#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- opentofu/install.sh"
echo "-------------------------------------------------------------------"

# Adapted from https://opentofu.org/docs/intro/install/deb/#step-by-step-instructions

echo "${ICON_INFO} Ensure that apt-transport-https, ca-certificates, curl and gnupg are installed..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

echo "${ICON_INFO} Downloading GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://get.opentofu.org/opentofu.gpg | sudo tee /etc/apt/keyrings/opentofu.gpg >/dev/null
curl -fsSL https://packages.opentofu.org/opentofu/tofu/gpgkey | sudo gpg --no-tty --batch --dearmor -o /etc/apt/keyrings/opentofu-repo.gpg >/dev/null
sudo chmod a+r /etc/apt/keyrings/opentofu.gpg /etc/apt/keyrings/opentofu-repo.gpg

echo "${ICON_INFO} Adding OpenTofu repository at /etc/apt/sources.list.d/opentofu.list ..."
echo \
  "deb [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main
deb-src [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main" | \
  sudo tee /etc/apt/sources.list.d/opentofu.list > /dev/null
sudo chmod a+r /etc/apt/sources.list.d/opentofu.list

echo "${ICON_INFO} Installing OpenTofu package..."
sudo apt-get update
sudo apt-get install -y tofu

echo "${ICON_OK} OpenTofu has been installed, version $(tofu --version | head -n 1)"


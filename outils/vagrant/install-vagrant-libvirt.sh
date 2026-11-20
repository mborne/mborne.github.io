#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- vagrant/install-vagrant-libvirt.sh"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Installing vagrant-libvirt plugin dependencies (build-essential, libxslt-dev, libxml2-dev, libvirt-dev, zlib1g-dev, ruby-dev) ..."
sudo apt-get install -y build-essential libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev

echo "${ICON_INFO} Installing vagrant-libvirt plugin ..."
vagrant plugin install vagrant-libvirt

echo "${ICON_OK} vagrant-libvirt plugin installation completed, displaying version: $(vagrant plugin list | grep vagrant-libvirt)"


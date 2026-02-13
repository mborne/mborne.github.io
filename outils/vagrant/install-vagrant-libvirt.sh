#!/bin/bash

# Install vagrant plugin dependencies
sudo apt-get install build-essential libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
# Install vagrant plugin
vagrant plugin install vagrant-libvirt
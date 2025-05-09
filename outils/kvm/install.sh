#!/bin/bash

sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# add current user to libvirt
sudo adduser $USER libvirt

virsh list --all
sudo systemctl status libvirtd


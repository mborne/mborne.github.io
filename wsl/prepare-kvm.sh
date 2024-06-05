#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
sudo systemctl mask snapd.service



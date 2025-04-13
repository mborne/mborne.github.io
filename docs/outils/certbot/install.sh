#!/bin/bash

sudo apt-get update
sudo apt-get install -y software-properties-common

sudo apt-add-repository -y ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y certbot


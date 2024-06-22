#!/bin/bash

#----------------------------------------------------
# installation des pré-requis à la création de venv
#----------------------------------------------------
sudo apt-get update
sudo apt-get install -y python3-venv

python3 -m venv ~/tts-venv
source ~/tts-venv/bin/activate
pip install piper-tts

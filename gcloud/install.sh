#!/bin/bash

sudo rm -rf /etc/apt/sources.list.d/google-cloud-sdk.list
sudo rm -rf /usr/share/keyrings/cloud.google.gpg

# Source : https://cloud.google.com/sdk/docs/install?hl=fr#deb

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update
sudo apt-get install -y google-cloud-cli google-cloud-sdk-gke-gcloud-auth-plugin

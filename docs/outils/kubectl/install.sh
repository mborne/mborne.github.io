#!/bin/bash

LAST_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)

echo "Téléchargement de kubectl ${LAST_VERSION}"
sudo curl -Lo /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${LAST_VERSION}/bin/linux/amd64/kubectl"
sudo chmod +x /usr/local/bin/kubectl

# autocomplétion
sudo apt install bash-completion
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null


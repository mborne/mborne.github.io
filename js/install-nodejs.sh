#!/bin/bash

# from https://deb.nodesource.com/node_20.x

NODE_MAJOR=${NODE_MAJOR:-20}

echo "-------------------------------------------------------------------"
echo "-- nodejs/install.sh - ${NODE_MAJOR}.x ..."
echo "-------------------------------------------------------------------"

sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update && sudo apt-get install nodejs -y

echo "-------------------------------------------------------------------"
echo "-- node : $(node --version)"
echo "-- npm : $(npm --version)"
echo "-------------------------------------------------------------------"

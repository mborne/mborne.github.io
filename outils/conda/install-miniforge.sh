#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- conda/install-miniforge.sh"
echo "-------------------------------------------------------------------"

if ! command -v curl &> /dev/null
then
    echo "${ICON_INFO} curl is required, installing it (sudo apt-get update && sudo apt-get install -y curl)"
    sudo apt-get update && sudo apt-get install -y curl
fi

# source : https://github.com/conda-forge/miniforge?tab=readme-ov-file#as-part-of-a-ci-pipeline
echo "${ICON_INFO} Downloading and installing Miniforge3 at ${HOME}/miniforge ..."
curl -fsSLo /tmp/Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash /tmp/Miniforge3.sh -u -b -p "${HOME}/miniforge"

echo "${ICON_INFO} Run conda init ..."
source "${HOME}/miniforge/etc/profile.d/conda.sh"
conda init


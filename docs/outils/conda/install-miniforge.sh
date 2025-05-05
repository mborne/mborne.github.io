#!/bin/bash

# source : https://github.com/conda-forge/miniforge?tab=readme-ov-file#as-part-of-a-ci-pipeline

if ! command -v curl &> /dev/null
then
    echo "curl is required (sudo apt-get update && sudo apt-get install -y curl)"
    exit 1
fi

curl -fsSLo /tmp/Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash /tmp/Miniforge3.sh -b -p "${HOME}/miniforge"

source "${HOME}/miniforge/etc/profile.d/conda.sh"
conda init


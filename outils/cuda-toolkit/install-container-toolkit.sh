#!/bin/bash

# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- cuda-toolkit/install-container-toolkit.sh"
echo "-------------------------------------------------------------------"

if ! command -v curl &> /dev/null
then
    echo "${ICON_INFO} curl is required, installing it (sudo apt-get update && sudo apt-get install -y curl)"
    sudo apt-get update && sudo apt-get install -y curl
fi

if ! command -v docker &> /dev/null
then
    echo "${ICON_ERROR} Docker is required, please install it first"
    exit 1
fi

echo "${ICON_INFO} Adding the package repositories for the NVIDIA Container Toolkit ..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo "${ICON_INFO} Installing the NVIDIA Container Toolkit ..."
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

echo "${ICON_INFO} Restarting Docker ..."
sudo service docker restart

echo "${ICON_INFO} Running a test container ..."
sudo docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark


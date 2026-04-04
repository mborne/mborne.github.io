#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

# check architecture
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "aarch64" ]; then
    echo "${ICON_ERROR} Unsupported architecture: $ARCH"
    echo "kubectl installation is only supported on x86_64 and aarch64 architectures."
    exit 1
fi

echo "${ICON_INFO} Ensure that curl is installed..."
sudo apt-get update && sudo apt-get install -y curl

echo "${ICON_INFO} Retrieve the latest stable version of kubectl..."
LAST_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)

echo "${ICON_INFO} Downloading kubectl ${LAST_VERSION} at /usr/local/bin/kubectl..."
if [ "$ARCH" = "x86_64" ]; then
    sudo curl -Lo /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${LAST_VERSION}/bin/linux/amd64/kubectl"
elif [ "$ARCH" = "aarch64" ]; then
    sudo curl -Lo /usr/local/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/${LAST_VERSION}/bin/linux/arm64/kubectl"
fi
sudo chmod +x /usr/local/bin/kubectl

echo "${ICON_INFO} Setting up kubectl bash completion..."
sudo apt install bash-completion
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null

echo "${ICON_OK} kubectl installation and bash completion setup is complete :"
kubectl version --client


#!/bin/bash

VERSION=${VERSION:-1.4.4}

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- install-mkcert.sh "
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Ensure that curl and wget are installed..."
sudo apt-get update && sudo apt-get install -y curl wget

echo "${ICON_INFO} Checking for the latest version of mkcert..."
LAST_VERSION=$(curl --silent "https://api.github.com/repos/FiloSottile/mkcert/releases/latest" | jq -r .tag_name)

# display warning if a newer version of mkcert is available
if [ "v$VERSION" != "$LAST_VERSION" ]; then
    echo "${ICON_WARN} A newer version of mkcert is available: $LAST_VERSION (current: $VERSION)"
    sleep 1
else
    echo "${ICON_OK} Installing latest version of mkcert: $VERSION"
fi

echo "${ICON_INFO} Downloading mkcert v$VERSION to /usr/local/bin/mkcert ..."
ARCH=$(dpkg --print-architecture)
URL=https://github.com/FiloSottile/mkcert/releases/download/v${VERSION}/mkcert-v${VERSION}-linux-${ARCH}
curl -sL $URL -o /tmp/mkcert
chmod +x /tmp/mkcert
sudo rm -rf /usr/local/bin/mkcert
sudo mv /tmp/mkcert /usr/local/bin/.

# Pour permettre la configuration du navigateur :
echo "${ICON_INFO} Install libnss3-tools to allow mkcert to configure the browser (TRUST_STORES=nss mkcert -install)..."
sudo apt-get update && sudo apt-get install -y libnss3-tools

echo "${ICON_OK} mkcert has been installed to /usr/local/bin/mkcert : $(mkcert --version)"

echo "${ICON_INFO} Usage : mkcert --help"






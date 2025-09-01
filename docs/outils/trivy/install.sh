#!/bin/bash

if ! command -v jq &> /dev/null
then
    echo "jq is required (sudo apt-get update && sudo apt-get install -y jq)"
    exit 1
fi

LAST_VERSION=$(curl --silent "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | jq -r .tag_name)
VERSION=0.65.0
URL=https://github.com/aquasecurity/trivy/releases/download/v${VERSION}/trivy_${VERSION}_Linux-64bit.deb

echo "-------------------------------------------------------------------"
echo "-- trivy/install.sh - v$VERSION (latest=$LAST_VERSION)"
echo "-------------------------------------------------------------------"

wget -nc -qO /tmp/trivy_${VERSION}_Linux-64bit.deb $URL
sudo dpkg -i /tmp/trivy_${VERSION}_Linux-64bit.deb

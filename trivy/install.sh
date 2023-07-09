#!/bin/bash

VERSION=0.42.1
URL=https://github.com/aquasecurity/trivy/releases/download/v${VERSION}/trivy_${VERSION}_Linux-64bit.deb

echo "-------------------------------------------------------------------"
echo "-- trivy/install.sh - v$VERSION"
echo "-------------------------------------------------------------------"

wget -nc -O /tmp/trivy_${VERSION}_Linux-64bit.deb $URL
sudo dpkg -i /tmp/trivy_${VERSION}_Linux-64bit.deb


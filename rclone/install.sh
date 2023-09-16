#!/bin/bash

# https://downloads.rclone.org/version.txt
VERSION=${VERSION:-1.64.0}

echo "-------------------------------------------------------------------"
echo "-- rclone/install.sh - v$VERSION"
echo "-------------------------------------------------------------------"

ARCH=$(dpkg --print-architecture)
URL=https://downloads.rclone.org/v${VERSION}/rclone-v${VERSION}-linux-${ARCH}.deb

wget -nc -O /tmp/rclone-v${VERSION}-linux-${ARCH}.deb $URL
sudo dpkg -i /tmp/rclone-v${VERSION}-linux-${ARCH}.deb

#!/bin/bash

echo "-------------------------------------------------------------------"
echo "-- rclone/install.sh - v$VERSION"
echo "-------------------------------------------------------------------"

VERSION=${VERSION:-1.62.2}
ARCH=$(dpkg --print-architecture)
URL=https://downloads.rclone.org/v${VERSION}/rclone-v${VERSION}-linux-${ARCH}.deb

wget -nc -O /tmp/rclone-v${VERSION}-linux-${ARCH}.deb $URL
dpkg -i /tmp/rclone-v${VERSION}-linux-${ARCH}.deb

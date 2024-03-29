#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Must be run as root (use sudo)"
    exit
fi

LAST_VERSION=$(bash ${SCRIPT_DIR}/latest.sh)
VERSION=${VERSION:-0.16.4}

echo "-------------------------------------------------------------------"
echo "-- restic/install.sh - v$VERSION (latest=${LAST_VERSION})"
echo "-------------------------------------------------------------------"

ARCH=$(dpkg --print-architecture)
URL=https://github.com/restic/restic/releases/download/v${VERSION}/restic_${VERSION}_linux_${ARCH}.bz2

echo "download $URL to /tmp/restic.bz2..."
wget -qO /tmp/restic.bz2 $URL

echo "extract /tmp/restic.bz2 to /usr/local/bin/restic..."
bzip2 -d /tmp/restic.bz2
chmod +x /tmp/restic
mv /tmp/restic /usr/local/bin/.





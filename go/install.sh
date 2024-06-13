#!/bin/bash

VERSION=${VERSION:-1.22.4}

wget -O /tmp/go.tar.gz "https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz"

sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf /tmp/go.tar.gz




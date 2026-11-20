#!/bin/bash

# Deprecated : this script has moved to libvirt/create-ubuntu-server.sh
# (see https://mborne.github.io/outils/libvirt/). Kept for compatibility.

set -euo pipefail

echo "⚠️  kvm/create-ubuntu-server.sh is deprecated, use https://mborne.github.io/outils/libvirt/create-ubuntu-server.sh"

curl -sS https://mborne.github.io/outils/libvirt/create-ubuntu-server.sh | bash

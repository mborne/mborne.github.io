#!/bin/bash

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Should not be run as root (don't use sudo)"
    exit
fi

# ~/.kubescape/bin/kubescape
#curl -s https://raw.githubusercontent.com/kubescape/kubescape/master/install.sh | /bin/bash

if ! grep -q .kubescape "$HOME/.profile"; then
    echo "add kubescape to path in ~/.profile (use source ~/.profile to reload)"
    echo 'export PATH="$HOME/.kubescape/bin:$PATH"' >> "$HOME/.profile"
fi


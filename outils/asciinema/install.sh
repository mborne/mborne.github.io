#!/bin/bash

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- asciinema/install.sh"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Installing asciinema package..."
sudo apt-get update
sudo apt-get install -y asciinema
echo "${ICON_OK} asciinema installed, version : $(asciinema --version)"



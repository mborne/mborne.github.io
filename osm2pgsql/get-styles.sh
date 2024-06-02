#!/bin/bash

OSMCARTO_VERSION="5.8.0"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
STYLES_DIR=${SCRIPT_DIR}/styles

rm -rf "${STYLES_DIR}"
mkdir -p "${STYLES_DIR}"

# download
wget "https://github.com/gravitystorm/openstreetmap-carto/archive/refs/tags/v$OSMCARTO_VERSION.zip" \
    -O $STYLES_DIR/style.zip

# extract
unzip "$STYLES_DIR/style.zip" -d "$STYLES_DIR/"
mv "$STYLES_DIR/openstreetmap-carto-$OSMCARTO_VERSION" "$STYLES_DIR/openstreetmap-carto"

# cleanup
rm -rf "$STYLES_DIR/style.zip"


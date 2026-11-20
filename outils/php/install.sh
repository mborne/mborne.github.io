#!/bin/bash

# Note : wait for PHP 8.4 in php-cs-fixer before updating default version 
# see https://github.com/PHP-CS-Fixer/PHP-CS-Fixer?tab=readme-ov-file#supported-php-versions
VERSION=${VERSION:-8.3}

ICON_INFO=$(printf "ℹ️ \x08 ")
ICON_WARN=$(printf "⚠️ \x08 ")
ICON_ERROR=$(printf "❌ \x08 ")
ICON_OK=$(printf "✅ \x08 ")

echo "-------------------------------------------------------------------"
echo "-- php/install.sh - $VERSION"
echo "-------------------------------------------------------------------"

echo "${ICON_INFO} Adding ondrej/php PPA repository for PHP..."
sudo apt-add-repository -y ppa:ondrej/php

echo "${ICON_INFO} Installing PHP $VERSION and extensions..."
sudo apt-get update
sudo apt-get install -y php${VERSION}-cli \
    php${VERSION}-xdebug \
    php${VERSION}-curl \
    php${VERSION}-gd \
    php${VERSION}-intl \
    php${VERSION}-xml \
    php${VERSION}-ldap \
    php${VERSION}-mbstring \
    php${VERSION}-sqlite3 \
    php${VERSION}-pgsql \
    php${VERSION}-zip

echo "${ICON_OK} PHP $VERSION and extensions installed successfully."

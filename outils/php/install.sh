#!/bin/bash

# Note : wait for PHP 8.4 in php-cs-fixer before updating default version 
# see https://github.com/PHP-CS-Fixer/PHP-CS-Fixer?tab=readme-ov-file#supported-php-versions
VERSION=${VERSION:-8.3}

echo "-------------------------------------------------------------------"
echo "-- php/install.sh - $VERSION"
echo "-------------------------------------------------------------------"

sudo apt-add-repository -y ppa:ondrej/php

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


#!/bin/bash

VERSION=${VERSION:-8.4}

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


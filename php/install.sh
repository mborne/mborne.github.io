#!/bin/bash

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

# PHP composer
curl -s https://getcomposer.org/installer | php
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer

# symfony CLI
curl -sS https://get.symfony.com/cli/installer | bash
sudo mv "$HOME/.symfony5/bin/symfony" /usr/local/bin/.




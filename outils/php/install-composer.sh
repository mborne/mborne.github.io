#!/bin/bash

# PHP composer
curl -s https://getcomposer.org/installer | php
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer



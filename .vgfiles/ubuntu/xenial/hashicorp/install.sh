#!/bin/bash

# Later this script will be split into parts, clusters and for some services a dedicated container is also being prepared and tested ...

# Set global variables
export DEBIAN_FRONTEND=noninteractive
export COMPOSER_ALLOW_SUPERUSER=1
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# http://www.cyberciti.biz/faq/ubuntu-linux-14-04-install-php7-using-apt-get-command/
# https://github.com/oerdnj/deb.sury.org/issues/56
# Setup simple lamp environment.
# Install PHP.
set -gx  LC_ALL en_US.UTF-8
sudo apt-get update && apt-get install -y language-pack-en-base
sudo apt-get install -y software-properties-common
sudo add-apt-repository --yes ppa:ondrej/php
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install php7.0 php7.0-cli php7.0-fpm php7.0-gd php7.0-json php7.0-mysql php7.0-readline  php7.0-bcmath  php7.0-mbstring  php7.0-soap php7.0-xml php7.0-zip -y

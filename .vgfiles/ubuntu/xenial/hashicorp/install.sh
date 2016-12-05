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
sudo apt-get update && apt-get install -y language-pack-en-base
sudo apt-get install -y software-properties-common
sudo add-apt-repository --yes ppa:ondrej/php
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install php7.0 php7.0-cli php7.0-fpm php7.0-gd php7.0-json php7.0-mysql php7.0-readline  php7.0-bcmath  php7.0-mbstring  php7.0-soap php7.0-xml php7.0-zip -y

# Install Apache
sudo apt-get -y install apache2

# Install mysql-server
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server

# Runy, Compass, gems
sudo apt-get purge ruby*
sudo apt-add-repository --yes ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.3 ruby2.3-dev -y
sudo gem install compass
sudo gem install bootstrap-sass

# Install drush
sudo apt-get install drush -y
php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > drush
php drush core-status
chmod +x drush
sudo mv drush /usr/local/bin

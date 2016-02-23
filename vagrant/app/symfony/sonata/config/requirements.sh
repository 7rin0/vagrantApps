#!/bin/bash

# Move old source to releases by date
cd /vagrant/app/symfony/sonata
mkdir releases
mv current releases/sonata_$(date +%F-%T)

# Create current directory and install project and their vendors
git clone https://github.com/7rin0/sandbox.git current
cd current
composer install --prefer-source --no-interaction

# Set permissions
sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/cache
sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/logs
sudo chown -R $(whoami):www-data *

# Set configs, Create database schema and load data
sudo cp -f /vagrant/app/symfony/sonata/config/parameters.yml /vagrant/app/symfony/sonata/current/app/config/parameters.yml
sudo mysql -u root -proot -h localhost -e'create database sonata'
cd /vagrant/app/symfony/sonata/current
php app/console doctrine:schema:create
php app/console doctrine:fixtures:load -y
php app/console fos:user:create --super-admin admin admin@domain.com admin
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/symfony/sonata/current/web/app_dev.php

# Add host and restart apache
sudo cp -f /vagrant/app/symfony/sonata/config/sonata.conf /etc/apache2/sites-available/sonata.conf
sudo a2ensite sonata

# Setup a Sonata/Symfony CMF project
#isudo DATABASE_NAME=sonata DATABASE_USER=root DATABASE_PASSWORD="root" COMPOSER_PROCESS_TIMEOUT=600 composer create-project sonata-project/sandbox:2.3.x-dev current -n
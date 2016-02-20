#!/bin/bash

# Generate releases
cd /vagrant/app/symfony/sonata
mkdir releases && mv current releases/sonata_$(date +%F-%T)

# Setup a Sonata/Symfony CMF project
sudo DATABASE_NAME=sonata DATABASE_USER=root DATABASE_PASSWORD="root" COMPOSER_PROCESS_TIMEOUT=600 composer create-project sonata-project/sandbox:2.3.x-dev current
#sudo cp -f /vagrant/app/symfony/sonata/config/parameters.yml /vagrant/app/symfony/sonata/current/app/config/parameters.yml
sudo mysql -u root -proot -h localhost -e'create database sonata'
#sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/cache
#sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/logs
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/symfony/sonata/current/web/app_dev.php

# Install Sonata's project ready to run
cd /vagrant/app/symfony/sonata/current
sudo COMPOSER_PROCESS_TIMEOUT=600 composer install -n
sudo COMPOSER_PROCESS_TIMEOUT=600 composer update -n
php app/console doctrine:database:create --if-not-exists -n
php app/console doctrine:schema:create
php app/console fos:user:create --super-admin admin admin@domain.com admin

# Set params
sudo cp -f /vagrant/app/symfony/sonata/config/sonata.conf /etc/apache2/sites-available/sonata.conf
sudo a2ensite sonata

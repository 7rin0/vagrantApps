#!/bin/bash

# Generate releases
cd /vagrant/app/symfony/sonata
mkdir releases && mv current releases/sonata_$(date +%F-%T)

# Setup a Sonata/Symfony CMF project
sudo DATABASE_NAME=sonata DATABASE_USER=root DATABASE_PASSWORD="root" COMPOSER_PROCESS_TIMEOUT=600 composer create-project sonata-project/sandbox:2.3.x-dev current -n
sudo mysql -u root -proot -h localhost -e'create database sonata'
sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/cache
sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/logs
sudo chown -R $(whoami):www-data *
cd /vagrant/app/symfony/sonata/current
php app/console doctrine:schema:create
php app/console fos:user:create --super-admin admin admin@domain.com admin
php app/console doctrine:fixtures:load -y
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/symfony/sonata/current/web/app_dev.php

# Set params
sudo cp -f /vagrant/app/symfony/sonata/config/sonata.conf /etc/apache2/sites-available/sonata.conf
sudo a2ensite sonata

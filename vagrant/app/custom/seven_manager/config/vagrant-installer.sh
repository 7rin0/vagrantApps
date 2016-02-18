#!/bin/bash

# Setup a seven_manager/Symfony CMF project
cd /vagrant/app/custom/seven_manager
mkdir releases
mv current releases/seven_manager_$(date +%F-%T)
git clone https://github.com/7rin0/SevenManager.git current
cd current
sudo DATABASE_NAME=seven_manager DATABASE_USER=root DATABASE_PASSWORD="root" COMPOSER_PROCESS_TIMEOUT=900 composer install -n
#sudo cp -f /vagrant/app/custom/seven_manager/config/parameters.yml /vagrant/app/custom/seven_manager/current/app/config/parameters.yml
sudo mysql -u root -proot -h localhost -e'create database seven_manager'
#sudo chmod -R 777 /vagrant/app/custom/seven_manager/current/app/cache
#sudo chmod -R 777 /vagrant/app/custom/seven_manager/current/app/logs
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/custom/seven_manager/current/web/app_dev.php

# Install seven_manager's project ready to run
cd /vagrant/app/custom/seven_manager/current
sudo COMPOSER_PROCESS_TIMEOUT=600 composer install -n
sudo COMPOSER_PROCESS_TIMEOUT=600 composer update -n
php app/console doctrine:database:create --if-not-exists -n
php app/console doctrine:schema:create
php app/console fos:user:create --super-admin admin admin@domain.com admin

# Set params
sudo cp -f /vagrant/app/custom/seven_manager/config/seven_manager.conf /etc/apache2/sites-available/seven_manager.conf
sudo sed -i -e '1 i\ 127.0.0.1 seven_manager.vm ' /etc/hosts
sudo a2ensite seven_manager

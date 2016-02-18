#!/bin/bash

# Setup a seven_manager/Symfony CMF project
cd /vagrant/app/custom/seven_manager
mkdir releases
mv current releases/seven_manager_$(date +%F-%T)
git clone https://github.com/7rin0/SevenManager.git current
cd current
sudo DATABASE_NAME=seven_manager DATABASE_USER=root DATABASE_PASSWORD="root" COMPOSER_PROCESS_TIMEOUT=900 composer install -n
sudo mysql -u root -proot -h localhost -e'create database seven_manager' --if-not-exists
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/custom/seven_manager/current/web/app_dev.php
sudo cp -f /vagrant/app/custom/seven_manager/config/parameters.yml /vagrant/app/custom/seven_manager/current/app/config/parameters.yml

# Install project
php app/console doctrine:phpcr:init:dbal --force
php app/console doctrine:phpcr:repository:init
php app/console doctrine:phpcr:fixtures:load -n
php app/console fos:user:create admin admin@admin.com admin --super-admin
php app/console assets:install
php app/console assetic:dump

# Set params
sudo cp -f /vagrant/app/custom/seven_manager/config/seven_manager.conf /etc/apache2/sites-available/seven_manager.conf
sudo sed -i -e '1 i\ 127.0.0.1 seven_manager.vm ' /etc/hosts
sudo a2ensite seven_manager

#!/bin/bash

# Install Drush and Setup a Symfony 3 project
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony
cd /vagrant/app/symfony/3 && sudo rm -rf current && symfony new current 3.0
sudo mysql -u root -proot -h localhost -e'create database symfony_3'
sudo chmod -R 777 /vagrant/app/symfony/3/current/app/cache
sudo chmod -R 777 /vagrant/app/symfony/3/current/app/logs
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/symfony/3/current/web/app_dev.php

# Set params
sudo cp -f /vagrant/app/symfony/3/config/symfony_3.conf /etc/apache2/sites-available/symfony_3.conf
sudo sed -i -e '1 i\ 127.0.0.1 symfony-3.vm ' /etc/hosts
sudo a2ensite symfony_3

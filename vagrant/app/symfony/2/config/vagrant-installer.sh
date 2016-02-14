#!/bin/bash

# Setup a Symfony 2 project
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony
cd /vagrant/app/symfony/2 && symfony new current 2.8
sudo cp -f /vagrant/app/symfony/2/config/parameters.yml /vagrant/app/symfony/2/current/app/config/parameters.yml
sudo mysql -u root -proot -h localhost -e'create database symfony_2'
sudo chmod -R 777 /vagrant/app/symfony/2/current/app/cache
sudo chmod -R 777 /vagrant/app/symfony/2/current/app/logs
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/symfony/2/current/web/app_dev.php

# Set params
sudo cp -f /vagrant/app/symfony/2/config/symfony_2.conf /etc/apache2/sites-available/symfony_2.conf
sudo sed -i -e '1 i\ 127.0.0.1 symfony-2.vm ' /etc/hosts
sudo a2ensite symfony_2

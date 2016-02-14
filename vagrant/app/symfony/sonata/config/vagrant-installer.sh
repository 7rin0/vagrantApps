#!/bin/bash

# Setup a Sonata/Symfony CMF project
cd /vagrant/app/symfony/sonata && composer create-project sonata-project/sandbox:2.3.x-dev current
sudo cp -f /vagrant/app/symfony/sonata/config/parameters.yml /vagrant/app/symfony/sonata/current/app/config/parameters.yml
sudo mysql -u root -proot -h localhost -e'create database sonata'
sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/cache
sudo chmod -R 777 /vagrant/app/symfony/sonata/current/app/logs
sudo sed -i "s/'127.0.0.1'/'127.0.0.1', '192.168.75.1'/g" /vagrant/app/symfony/sonata/current/web/app_dev.php

# Install Sonata's project ready to run
cd /vagrant/app/symfony/sonata/current
sudo composer install -n
sudo app/console doctrine:database:create
sudo app/console doctrine:phpcr:init:dbal
sudo app/console doctrine:phpcr:repository:init
sudo app/console doctrine:phpcr:fixtures:load
sudo app/console fos:user:create admin admin@admin.com admin --super-admin
sudo app/console assets:install
sudo app/console assetic:dump

# Set params
sudo cp -f /vagrant/app/symfony/sonata/config/sonata.conf /etc/apache2/sites-available/sonata.conf
sudo sed -i -e '1 i\ 127.0.0.1 sonata.vm ' /etc/hosts
sudo a2ensite sonata

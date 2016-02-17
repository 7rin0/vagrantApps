#!/bin/bash

# Setup a Wordpress 4 project
cd /vagrant/app/wordpress/4
mkdir releases && mv current releases/wp4_$(date +%F-%T)
sudo wget https://wordpress.org/latest.zip -O current.zip && unzip current.zip && mv wordpress current && rm -rf current.zip
sudo cp -f /vagrant/app/wordpress/4/config/wp-config.php /vagrant/app/wordpress/4/current/wp-config.php
sudo mysql -u root -proot -h localhost -e'create database wordpress_4'

# Set params
sudo cp -f /vagrant/app/wordpress/4/config/wordpress_4.conf /etc/apache2/sites-available/wordpress_4.conf
sudo sed -i -e '1 i\ 127.0.0.1 wordpress-4.vm ' /etc/hosts
sudo a2ensite wordpress_4
sudo service apache2 restart -y

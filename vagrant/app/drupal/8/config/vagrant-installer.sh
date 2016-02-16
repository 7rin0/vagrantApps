#!/bin/bash

# Install Drush
if ! [ -f /usr/local/bin/drush ]
then
	sudo wget http://files.drush.org/drush.phar -O /usr/local/bin/drush
	sudo chmod 775 /usr/local/bin/drush
fi

# Setup a Drupal 8 project
sudo drush dl drupal-8 --destination="/vagrant/app/drupal/8" --drupal-project-rename="current" -y
cd /vagrant/app/drupal/8/current && sudo composer install -n
sudo mysql -u root -proot -h localhost -e'create database drupal_8'
sudo mkdir -p /vagrant/app/drupal/8/current/sites/default/files
sudo mkdir -p /vagrant/app/drupal/8/current/sites/default/files/translations
sudo chmod -R 777 /vagrant/app/drupal/8/current/sites/default/files

# Set params
sudo cp -f /vagrant/app/drupal/8/config/settings.php /vagrant/app/drupal/8/current/sites/default/settings.php
sudo drush site-install standard --db-url='mysql://root:root@localhost/drupal_8' --account-name='admin' --account-pass='admin' --site-name='Drupal 8' -y
sudo cp -f /vagrant/app/drupal/8/config/drupal_8.conf /etc/apache2/sites-available/drupal_8.conf
sudo sed -i -e '1 i\ 127.0.0.1 drupal-8.vm ' /etc/hosts
sudo a2ensite drupal_8

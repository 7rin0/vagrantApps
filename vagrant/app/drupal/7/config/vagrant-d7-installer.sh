#!/bin/bash

# Install Drush and Setup a Drupal 7 project
sudo DEBIAN_FRONTEND=noninteractive apt-get install drush -y
sudo drush dl drupal-7 --destination="/vagrant/app/drupal/7" --drupal-project-rename="current" -y
sudo mysql -u root -proot -h localhost -e'create database drupal_7'
sudo mkdir -p /vagrant/app/drupal/7/current/sites/default/files
sudo mkdir -p /vagrant/app/drupal/7/current/sites/default/files/translations
sudo chmod -R 777 /vagrant/app/drupal/7/current/sites/default/files

# Set params
sudo cp -f /vagrant/app/drupal/7/config/settings.php /vagrant/app/drupal/7/current/sites/default/settings.php
sudo cp -f /vagrant/app/drupal/7/config/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo sed -i -e '1 i\ 127.0.0.1 drupal-7.vm ' /etc/hosts
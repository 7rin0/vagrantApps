#!/bin/bash

## Add all possible hosts to machine to avoid duplications
sudo cat /vagrant/config/hosts/hosts >> /etc/hosts

# Comment next line to avoid last Drupal 7 installation
. /vagrant/app/drupal/7/config/requirements.sh

# Comment next line to avoid last Drupal 8 installation
. /vagrant/app/drupal/8/config/requirements.sh

# Comment next line to avoid last Symfony 2 installation
. /vagrant/app/symfony/2/config/requirements.sh

# Comment next line to avoid last Symfony 3 installation
. /vagrant/app/symfony/3/config/requirements.sh

# Comment next line to avoid last Wordpress 4 installation
. /vagrant/app/wordpress/4/config/requirements.sh

# Comment next line to avoid last Seven Manager (custom project) installation
. /vagrant/app/custom/seven_manager/config/requirements.sh

# Restart services
sudo /etc/init.d/apache2 restart -y

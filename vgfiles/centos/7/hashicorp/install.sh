#!/bin/bash

# Update machine
sudo su
yum update -y
yum install epel-release -y
yum install gcc kernel-devel kernel-headers dkms make bzip2 perl -y
yum install kernel-devel-3.10.0-327.4.5.el7.x86_64 -y

# Install common packages
yum install zip -y
yum install git -y
yum install curl -y
yum install wget -y
yum install epel-release
yum install rubygems -y

# Install VirtualBox Guest Aditions
#wget http://download.virtualbox.org/virtualbox/4.3.36/VBoxGuestAdditions_4.3.36.iso > /dev/null
#mkdir /media/VBoxGuestAdditions
#mount -o loop,ro VBoxGuestAdditions_4.3.36.iso /media/VBoxGuestAdditions
#sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run --nox11
#rm -rf VBoxGuestAdditions_4.3.36.iso -y
#umount /media/VBoxGuestAdditions
#rm -rf /media/VBoxGuestAdditions

# Install LAMP their Modules
yum -y install httpd
rpm -Uvh http://repo.mysql.com/yum/mysql-5.5-community/el/7/x86_64/mysql-community-release-el7-5.noarch.rpm
yum -y install php php-pear
yum install -y gcc php-devel php-pear
yum -y install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel

# Versioning, Web-accelerators, cache
yum install git -y
curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer
composer config -g github-oauth.github.com f0502ecd3d7c8e7e47223616c177b869180a3e05
wget http://files.drush.org/drush.phar -O /usr/local/bin/drush > /dev/null
chmod 775 /usr/local/bin/drush

# Install required applications by current project(s)
# ("child-machines" are being prepared)
gem install sass
yum install -y ImageMagick ImageMagick-devel ImageMagick-perl

# VagrantApps - application auto-installer
Install and run one or more applications automatically 

## Requirements
Your OS must have this application installed
- Virtualbox
- Vagrant
- Git

## Add to your hosts
You may choose accordingly your needs or keep the possibility of test everything by adding the following hosts to your OS hosts file

Unix, Unix-like, POSIX */etc/hosts*, Windows: *%SystemRoot%\System32\drivers\etc\hosts*)
- 192.168.75.57   wordpress-4.vm
- 192.168.75.57   drupal-7.vm drupal-8.vm
- 192.168.75.57   symfony-2.vm sonata.vm symfony-3.vm

## Choosen Application
Modify your ./vagrant/bootstrap.sh file and uncomment at "Project Auto Installer" de vagrant-installers you need
For a Drupal 8 application uncomment ". /vagrant/app/drupal/8/config/vagrant-installer.sh"

## Install vagrantApps
Choose a preferred directory to work and lets get started!
- git clone https://github.com/7rin0/vagrantApps.git
- cd vagrantApps/vagrant
- vagrant up

## Project URL
Open in your browser the defined URL for your application
For a Drupal 8 application the url is http://drupal-8.vm/core/install.php

## Enjoy!

# VagrantApps - application auto-installer
Install and run one or more applications automatically 

## Requirements
- Virtualbox >= 4.3.36
- Vagrant >= 1.6.0
- Git >= 1.6

## Recommended
### Fix some Vagrant Guest Aditions issues
- vagrant plugin install vagrant-vbguest

## Add to your hosts
You may choose accordingly your needs or keep the possibility of test everything by adding the following hosts to your OS hosts file

The defined URL for each application
Unix, Unix-like, POSIX */etc/hosts*, Windows: *%SystemRoot%\System32\drivers\etc\hosts*)
- 192.168.75.57   wordpress-4.vm
- 192.168.75.57   drupal-7.vm drupal-8.vm
- 192.168.75.57   symfony-2.vm sonata.vm symfony-3.vm

## Choose your application
Modify your vagrant/bootstrap.sh file and comment the vagrant-installer's you don't need

## Install vagrantApps
Choose a preferred directory to work and lets get started!
- git clone https://github.com/7rin0/vagrantApps.git
- cd vagrantApps/vagrant
- vagrant up

## Project URL
Open in your browser the defined URL for your application

## Enjoy!

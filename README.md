# VagrantApps - Automated install of PHP based Applications
Automated installation of PHP based applications 

## Requirements
- Virtualbox >= 4.3.36
- Vagrant >= 1.6.0
- Git >= 1.6

## Recommended
'A Vagrant plugin to keep your VirtualBox Guest Additions up to date'
- vagrant plugin install vagrant-vbguest

## Add to your hosts
You may choose accordingly your needs or keep the possibility to test everything by adding the following hosts to your OS hosts file

The defined URL for each application
Unix, Unix-like, POSIX */etc/hosts*, Windows: *%SystemRoot%\System32\drivers\etc\hosts*)
- 192.168.75.57   wordpress-4.vm
- 192.168.75.57   drupal-7.vm drupal-8.vm
- 192.168.75.57   symfony-2.vm symfony-3.vm
- 192.168.75.58   sonata.vm

## Avoid install everything
Modify your config/install.sh to avoid install any undesired application by commenting the loaded script responsible for installation

## Install vagrantApps
Choose a preferred directory to work and lets go!
- git clone https://github.com/7rin0/vagrantApps.git
- cd vagrantApps
- vagrant up

## Project URL
Open in your browser the default URL of your application

## Enjoy!

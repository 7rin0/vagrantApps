# VagrantApps - application auto-installer
Install and run one or more applications automatically 

## Requirements
Your OS must have this applications installed
- Virtuabox
- Vagrant
- Git

## Add to your hosts
You may choose acordingly your needs or keep the possibility of test everything by adding the following hosts to your OS hosts file

Unix, Unix-like, POSIX */etc/hosts*, Windows: *%SystemRoot%\System32\drivers\etc\hosts*)
- 192.168.75.57   wordpress-4.vm
- 192.168.75.57   drupal-7.vm drupal-8.vm
- 192.168.75.57   symfony-2.vm sonata.vm symfony-3.vm

## Application branch
Select from github or command-line (git branch -r --list) the name of the branch related to your application type

For a Drupal 8 application the branch is: drupal-8

## Install vagrantApps
Choose a prefered directory to work and lets get started!
- git clone https://github.com/7rin0/vagrantApps.git
- git checkout *{application-branch}*
- cd vagrantApps/vagrant
- vagrant up


## Project URL
Open in your browser the defined URL to your application type

For a Drupal 8 application the url is drupal-8.vm

## Enjoy!

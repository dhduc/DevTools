#!/bin/sh

PROJECT='webadmin.local'
IP='127.0.0.1'

ENDC=`tput setaf 7`
RED=`tput setaf 1`
GREEN=`tput setaf 2`

echo 'Start install Webadmin'

# Attempt to sources.list
sudo sh -c -- 'echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list'
sudo sh -c -- 'echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list'

# Add GPG keys
sudo wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc

# Install
sudo apt-get update
sudo apt-get install webmin -y

# Configure Firewall
sudo ufw allow 10000

echo 'Go to' $GREEN 'https://'`whoami`:10000 $ENDC
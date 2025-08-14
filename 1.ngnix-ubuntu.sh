#!/bin/sh 

sudo su 

apt-get -y update 

apt-get -y install nginx 

echo "Welcome to Learning Azure AZ-900 $(hostname)" > /var/www/html/index.html 

sudo cat /var/www/html/index.html #to read the index.html file#

sudo nano /var/www/html/index.html #to edit the index.html file and add your own code base#

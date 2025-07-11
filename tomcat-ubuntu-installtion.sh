#!/usr/bin/bash

sudo hostnamectl set-hostname "u2-tomcat-ubuntu-24"

sudo apt update -y

sudo apt upgrade -y

sudo apt install openjdk-21-jre -y

sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat 

wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.43/bin/apache-tomcat-10.1.43.tar.gz

cd /tmp

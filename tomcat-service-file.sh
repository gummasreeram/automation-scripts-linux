#!/usr/bin/bash

sudo hostnamectl set-hostname "u2-tomcat-ubuntu-24"
sudo apt update -y
sudo apt upgrade -y
sudo apt install openjdk-21-jre -y
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.43/bin/apache-tomcat-10.1.43.tar.gz
sudo tar -xzvf apache-tomcat-10.1.43.tar.gz -C /opt/tomcat/ --strip-components=1
sudo chown -R tomcat:tomcat /opt/tomcat
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF

[Unit]
Description=Tomcat
After=network.target
[Service]
Type=forking

User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64"
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=on-faliure


[Install]

WantedBy=multi-user.target
EOF
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now tomcat.service

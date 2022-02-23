#!/bin/bash
# Description: to automate sonarqube download
# Author: Group2
# Date: 2/22/2022
echo "Automatic installation of Sonarqube in progress. Please wait ..."
echo
su - vagrant
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
#Description: connect to Sonarqube server via browser using the ip address
echo "http://192.168.56.33:9000"
echo "Installation completed. Thank you for your patience"
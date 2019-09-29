#!/bin/bash

#Update
sudo apt-get update && sudo apt-get upgrade -y

#Install Java
sudo add-apt-repository ppa:openjdk-r/ppa 
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk

#Download LifeRay
wget https://github.com/liferay/liferay-portal/releases/download/7.2.0-ga1/liferay-ce-portal-tomcat-7.2.0-ga1-20190531153709761.tar.gz

#Unpack
tar -xvzf liferay-ce-portal-tomcat-7.2.0-ga1-20190531153709761.tar.gz

#Make Swap File
sudo fallocate -l 10G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
#The following command will append the end of the file with the information provided
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

#Execute program
cd liferay-portal-7.2.0-ga1/tomcat-9.0.17/bin/
./startup.sh

#You must wait 5-8 minutes for the setup to complete

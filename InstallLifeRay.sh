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

#Execute program
cd liferay-portal-7.2.0-ga1/tomcat-9.0.17/bin/
./startup.sh

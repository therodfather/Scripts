#!/bin/bash

#Download Puppet
curl -O https://apt.puppetlabs.com/puppetlabs-release-pcl-xenial.deb

#Unpack
dpkg -i puppetlabs-release-pcl-xenial.deb

#Update
apt-get update
apt-get install puppetserver -y

#Allow through firewall
sudo ufw allow 8140

#Starts puppetserver and enables starting during boot time

systemctl start puppetserver
systemctl status puppetserver
systemctl enable puppetserver

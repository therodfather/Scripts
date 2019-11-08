#!/bin/bash

#Download Puppet repo
wget https://apt.puppetlabs.com/puppet6-release-xenial.deb

#Unpack
dpkg -i puppet6-release-xenial.deb

#Update
apt-get update
apt-get install puppetserver -y

#Allow through firewall
ufw allow 8140

#Starts puppetserver and enables starting during boot time

systemctl start puppetserver
systemctl status puppetserver
systemctl enable puppetserver

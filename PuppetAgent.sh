#!/bin/bash

#Update
apt-get update

#Download Puppet repo
wget https://apt.puppetlabs.com/puppet6-release-xenial.deb

#Unpack
dpkg -i puppet6-release-xenial.deb

#Update
apt-get update

#Install the Agent
apt-get install puppet-agent -y

#Allow through firewall
ufw allow 8140

#Start agent
systemctl start puppet
systemctl status puppet

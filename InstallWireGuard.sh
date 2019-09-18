#!/bin/bash

#Update
sudo apt-get update && sudo apt-get upgrade -y

#Download Algo
wget https://github.com/trailofbits/algo/archive/master.zip

#Unzip
sudo apt-get install unzip -y
unzip master.zip

#CD into new directory
cd algo-master/

#Install Algo
apt-get update && apt-get install build-essential libssl-dev libffi-dev python-dev python-pip python-setuptools python-virtualenv -y

#Start Virtual Environment
python -m virtualenv --python=`which python2` env && source env/bin/activate && python -m pip install -U pip virtualenv && python -m pip install -r requirements.txt

#Create INI file
touch vultr.ini
echo "[default] 
key = EUAVYIMY6GUSK4OS5WUROW2MIB7XD3OHDADA" > vultr.ini
#Run Algo
./algo << EOF
4
MyWire
N
N
N
y
N
/root/algo-master/vultr.ini
14
EOF

cd configs/
newip=$(ls -d */)
cd $newip/wireguard/

#Install grencode
sudo apt install qrencode -y
qrencode -t ansiutf8 < phone.conf




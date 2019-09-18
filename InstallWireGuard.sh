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
apt-get update && apt-get install \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    python-pip \
    python-setuptools \
    python-virtualenv -y

#Start Virtual Environment
python -m virtualenv --python=`which python2` env &&
    source env/bin/activate &&
    python -m pip install -U pip virtualenv &&
    python -m pip install -r requirements.txt

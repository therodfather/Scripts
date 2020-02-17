#!/bin/bash

#Update
sudo apt-get update

#Install Apache2
sudo apt install apache2 -y

#Adjust Firewall rules
sudo ufw app info "Apache Full" sudo ufw allow in "Apache Full"

#Install MySQL
sudo apt install mysql-server -y

sudo mysql << EOF
SELECT user,authentication_string,plugin,host FROM mysql.user;
exit
EOF

#Install PHP
sudo apt install php libapache2-mod-php php-mysql -y
echo "<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" > /etc/apache2/mods-enabled/dir.conf

#Restart Apache
sudo systemctl restart apache2

#Install Moodle
git clone -b MOODLE_36_STABLE git://git.moodle.org/moodle.git 

#Create new database
sudo mysql << EOF
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'admin'@'localhost' IDENTIFIED BY '!0024921sS';
GRANT ALL ON *.* TO 'admin'@'localhost';
flush privileges;
exit
EOF

cp -avr /root/moodle/ /var/www/html/moodle

#Create Data Directory
mkdir /home/moodledata
chmod -R 775 /home/moodledata
chmod -R 777 /home/moodledata
chmod 777 /home/moodledata

#Install extensions:
sudo apt install php-xml -y
sudo apt-get install php-curl php-zip php-gd php-intl php-mbstring php-xmlrpc php-soap -y
sudo service apache2 restart

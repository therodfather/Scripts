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

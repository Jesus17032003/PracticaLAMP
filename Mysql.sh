#!/bin/bash


sudo apt-get update
sudo apt-get install -y mysql-server git
sudo apt-get install net-tools



sudo service mysql start

git clone https://github.com/josejuansanchez/iaw-practica-lamp.git 


sudo su
mysql -u root < iaw-practica-lamp/db/database.sql
mysql -u root  <<EOF
Use lamp_db;
CREATE USER 'jesus'@'192.168.10.1' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON lamp_db.* TO 'jesus'@'192.168.10.1';
FLUSH PRIVILEGES;
EOF




sudo sed -i 's/^bind-address\s*=.*/bind-address = 192.168.10.2/' /etc/mysql/mysql.conf.d/mysqld.cnf


sudo systemctl restart mysql
sudo ip route del default
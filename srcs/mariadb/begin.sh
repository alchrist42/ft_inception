#!/bin/bash

# в глобальном файле настроек достаточно расскоментить порт и закомментить строку bind
sed -i "s/bind-ad/\#bind-ad/" "/etc/mysql/mariadb.conf.d/50-server.cnf"
sed -i "s/\#port  /port   /" "/etc/mysql/mariadb.conf.d/50-server.cnf"

if [ ! -d /var/lib/mysql/$DB_WP_NAME/ ]; then
    service mysql start
    echo "CREATE DATABASE IF NOT EXISTS $DB_WP_NAME;"| mysql -u root
    echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"| mysql -u root
    echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION;"| mysql -u root
    echo "FLUSH PRIVILEGES;"| mysql -u root
    mysqladmin -u root password ${DB_ROOT_PASSWORD}
    service mysql stop
else
    # без этого будет ошибка соединения с базой данных, достаточно создания сокета
    mkdir /var/run/mysqld
    mkfifo var/run/mysqld/mysqld.sock
fi
chown -R mysql:mysql /var/lib/mysql

mysqld
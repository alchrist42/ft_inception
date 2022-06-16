#!/bin/sh

check=$(find /var/www/wordpress -name index.php | wc -l)


if [ $check -eq "0" ] ;
then

# Скачеваем установочные файлы
wp core download    --allow-root --locale=ru_RU --path="/var/www/wordpress"

# Подключение к базе данных
wp core config	--allow-root \
				--skip-check \
				--dbname=$DB_WP_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_USER_PASSWORD \
				--dbhost=$DB_HOST \
				--dbprefix=$DB_PREFIX \
				--path="/var/www/wordpress"

# Устанавливаем и создаем администратора
wp core install	--allow-root \
				--url=$DOMAIN_NAME \
				--title="Inception" \
				--admin_user=$WP_ADMIN \
				--admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_EMAIL \
				--path="/var/www/wordpress"


# Создаем еще 2 пользователей
wp user create      alfa alfa@alchrist.42.com \
                    --role=author \
                    --user_pass="alfa" \
                    --allow-root \
					--path="/var/www/wordpress"

wp user create      betta betta@alchrist.42.com \
                    --role=author \
                    --user_pass="betta" \
                    --allow-root \
					--path="/var/www/wordpress"

fi

service php7.3-fpm start ;
service php7.3-fpm stop ;

exec php-fpm7.3 --nodaemonize
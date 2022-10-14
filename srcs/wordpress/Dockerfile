FROM debian:buster

# install php
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql &&\
    apt-get install curl -y

# download WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# create folder and change owner
RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# copy php socket settings
COPY ./php_conf/php-fpm.conf /etc/php/7.3/fpm/
COPY ./php_conf/www.conf /etc/php/7.3/fpm/pool.d/

# run start wp script
COPY ./start_wp.sh ./
CMD sh start_wp.sh


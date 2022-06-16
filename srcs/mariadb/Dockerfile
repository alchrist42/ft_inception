FROM debian:buster

# Download mariadb
RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y procps && \
    apt-get install net-tools &&\
    apt-get install curl -y

# Перекидываем файл конфигурации
# говорим что слушаем всех говорим порт и настривам Volume
# COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./mydb.cnf /etc/mysql/my.cnf
# RUN chmod 444 /etc/mysql/my.cnf

# ##  Тоже различные настройки
# RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN chmod 444 etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./begin.sh ./tmp
RUN chmod 755 ./tmp/begin.sh

CMD sh /tmp/begin.sh
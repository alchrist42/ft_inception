FROM debian:buster

# Download mariadb
RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y procps && \
    apt-get install net-tools &&\
    apt-get install curl -y

COPY ./mydb.cnf /etc/mysql/my.cnf

COPY ./begin.sh ./tmp
RUN chmod 755 ./tmp/begin.sh

CMD sh /tmp/begin.sh
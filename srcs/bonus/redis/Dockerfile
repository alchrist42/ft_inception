FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install redis-server php-redis -y

COPY ./redis.conf /etc/redis/redis.conf

CMD redis-server --protected-mode no

# check redis:
# sudo docker exec -it 01c5902ea0a2 /bin/bash
# redis-cli monitor

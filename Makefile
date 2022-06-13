PATH_BD = $$(pwd)/volumes/bd
PATH_WP	 = $$(pwd)/volumes/wp

all: up

up:
		mkdir -p $(PATH_BD) && sudo chmod 777 $(PATH_BD)
		mkdir -p $(PATH_WP) && sudo chmod 777 $(PATH_WP)
		sudo docker-compose -f srcs/docker-compose.yml build
		sudo docker-compose -f srcs/docker-compose.yml up -d


down:
		docker-compose down

stop:
		sudo docker stop $$(sudo docker ps -aq)

remove:
		sudo docker rm $$(sudo docker ps -aq)

rm_network:
		docker network rm $$(docker network ls -q)

rm_volumes:
		@sudo rm -rf ${PATH_BD} 
		@sudo rm -rf ${PATH_WP} 

clean:	stop remove rm_volume  rm_network rm_volumes


fclean: clean
		sudo docker-compose -f srcs/docker-compose.yaml down --rmi all
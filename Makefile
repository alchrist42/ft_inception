PATH_BD = ~/data/db
PATH_WP	 = ~/data/wp

all: up

up:
		mkdir -p $(PATH_BD) && sudo chmod 777 $(PATH_BD)
		mkdir -p $(PATH_WP) && sudo chmod 777 $(PATH_WP)
		sudo docker-compose -f srcs/docker-compose.yml build
		sudo docker-compose -f srcs/docker-compose.yml up -d


down:
		sudo docker-compose -f srcs/docker-compose.yml down

stop:
		sudo docker stop $$(sudo docker ps -aq)

remove:
		sudo docker rm $$(sudo docker ps -aq)

rm_volumes:
		@sudo rm -rf ${PATH_BD} 
		@sudo rm -rf ${PATH_WP} 

clean:	stop remove rm_volumes


fclean: clean
		sudo docker-compose -f srcs/docker-compose.yml down --rmi all

re:		fclean up
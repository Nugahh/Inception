#creat 'data' folder in /home/fwong/

all: 
	@if [ ! -e "srcs/.env" ]; then \
		if [ -e "/home/fwong/Desktop/InceptionOK/.env" ]; then \
			cp /home/fwong/Desktop/InceptionOK/.env srcs/.env; \
		fi; \
	fi;
	mkdir -p /home/fwong/data/mariadb
	mkdir -p /home/fwong/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	@if [ -e "srcs/.env" ]; then \
		docker compose -f ./srcs/docker-compose.yml down; \
	else \
		echo "Warning: .env file is missing. Docker compose services may not be stopped correctly."; \
	fi;
	-docker system prune -af
	rm -f ./srcs/.env

fclean: clean
	sudo rm -rf /home/fwong/data/mariadb/*
	sudo rm -rf /home/fwong/data/wordpress/*
	docker volume rm $(docker volume ls -q)

re: fclean all

.Phony: all logs clean fclean
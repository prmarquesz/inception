# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: proberto <proberto@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/25 15:00:00 by proberto          #+#    #+#              #
#    Updated: 2023/08/04 00:35:32 by proberto         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN=proberto.42.fr
COMPOSE=srcs/docker-compose.yml
VOL_DIR=~/proberto

all: setup

setup: volumes
	sudo chmod a+w /etc/hosts && \
	sudo cat /etc/hosts | grep ${DOMAIN} || \
	sudo echo "127.0.0.1 ${DOMAIN}" >> /etc/hosts
	docker-compose -f ${COMPOSE} up -d > /dev/null

volumes:
	mkdir -p ${VOL_DIR}/data/wordpress
	mkdir -p ${VOL_DIR}/data/mariadb

down:
	docker-compose -f ${COMPOSE} down

clean: down
	sudo rm -rf ${VOL_DIR}

fclean: clean
	docker system prune --volumes --all --force

re: fclean all
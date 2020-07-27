#!/usr/bin/env bash
docker stop docker-mysql
docker rm docker-mysql
docker run -d --name docker-mysql -p 3306:3306 -p 33306:3306 -v $HOME/workspace/persistent/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mysqladmin mysql

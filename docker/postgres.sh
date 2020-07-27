#!/usr/bin/env bash
docker stop docker-postgres
docker rm docker-postgres
docker run -d --name docker-postgres -p 5432:5432 -v $HOME/workspace/persistent/postgres:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgresadmin postgres:alpine

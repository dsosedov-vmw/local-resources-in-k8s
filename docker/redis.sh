#!/usr/bin/env bash
docker stop docker-redis
docker rm docker-redis
docker run -d --name docker-redis -p 6379:6379 -v $HOME/workspace/persistent/redis:/data redis:alpine --appendonly yes

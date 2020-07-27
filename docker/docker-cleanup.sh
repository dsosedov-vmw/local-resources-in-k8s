#!/usr/bin/env bash
docker container prune -f
docker image prune -af
docker image ls
docker ps -a

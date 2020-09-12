#!/usr/bin/env bash
docker stop docker-concourse
docker rm docker-concourse
docker run \
    -d \
    --privileged \
    --name docker-concourse \
    --link docker-postgres \
    -p 8181:8080 \
    -e CONCOURSE_POSTGRES_HOST=docker-postgres \
    -e CONCOURSE_POSTGRES_USER=postgres \
    -e CONCOURSE_POSTGRES_PASSWORD=postgresadmin \
    -e CONCOURSE_POSTGRES_DATABASE=concourse \
    -e CONCOURSE_EXTERNAL_URL=http://localhost:8181 \
    -e CONCOURSE_ADD_LOCAL_USER=admin:Admin!,ds:Ds! \
    -e CONCOURSE_MAIN_TEAM_LOCAL_USER=admin \
    -e CONCOURSE_WORKER_BAGGAGECLAIM_DRIVER=naive \
    -e CONCOURSE_CLIENT_SECRET=Y29uY291cnNlLXdlYgo= \
    -e CONCOURSE_TSA_CLIENT_SECRET=Y29uY291cnNlLXdvcmtlcgo= \
    concourse/concourse \
    quickstart

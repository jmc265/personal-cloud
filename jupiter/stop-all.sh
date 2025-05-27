#!/bin/bash

export COMPOSE_FILES="$(find . | grep "compose.yml")"

# Stop all Docker (compose) containers
for COMPOSE_FILE in $COMPOSE_FILES
do
    docker-compose -f $COMPOSE_FILE down
done
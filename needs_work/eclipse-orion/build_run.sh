#!/bin/bash

docker build --rm -t langdon/eclipse-orion .

DOCKER_ID=$(docker run --privileged -d -p 9090:8080 \
       -v /mnt/host-projects/:/host-files \
       -v /mnt/host-projects/eclipse-orion-local/workspace:/orion-serverworkspace \
    	langdon/eclipse-orion)

echo ID = $DOCKER_ID

docker logs $DOCKER_ID


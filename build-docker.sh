#!/bin/bash

export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0


set -e
NIFI_TAG=${NIFI_TAG:-1.13.2}
DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd $DIR/base
docker build --build-arg NIFI_TAG=${NIFI_TAG} --rm . -t pontusvisiongdpr/pontus-extract-nifi-base:${NIFI_TAG}

cd $DIR/full-nifi
docker build --build-arg NIFI_TAG=${NIFI_TAG} --rm . -t pontusvisiongdpr/pontus-extract-nifi:${NIFI_TAG}

cd $DIR/mysql-demo
docker build --rm . -t pontusvisiongdpr/pontus-extract-nifi-mysql-demo



#cd $DIR/full-minifi
#docker build --rm . -t pontusvisiongdpr/pontus-extract-minifi

docker push pontusvisiongdpr/pontus-extract-nifi-base:${NIFI_TAG}
docker push pontusvisiongdpr/pontus-extract-nifi:${NIFI_TAG}
docker push pontusvisiongdpr/pontus-extract-nifi-mysql-demo
#docker push pontusvisiongdpr/pontus-extract-minifi



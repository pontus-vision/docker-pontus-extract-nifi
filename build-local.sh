#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd $DIR/base
docker build --rm . -t pontusvisiongdpr/pontus-extract-nifi-base 
docker push pontusvisiongdpr/pontus-extract-nifi-base

cd $DIR/full-nifi
docker build --rm . -t pontusvisiongdpr/pontus-extract-nifi
docker push pontusvisiongdpr/pontus-extract-nifi

cd $DIR/full-minifi
docker build --rm . -t pontusvisiongdpr/pontus-extract-minifi
docker push pontusvisiongdpr/pontus-extract-minifi



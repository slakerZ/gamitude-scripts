#!/bin/bash
NAME=${1:-backend}
echo "updating $NAME"
docker stop gamitude_$NAME 2>/dev/null
echo "docker container stoped exit code $?"
docker container rm gamitude_$NAME 2>/dev/null
echo "docker container removed exit with code $?"
docker rmi gamitude/$NAME:latest 2>/dev/null
echo "docker image removed exit code $?"
docker load -q -i ~/gamitude/images/$NAME/gamitude_$NAME.tar 2>/dev/null
echo "docker image loaded exit code $?"
cd ~/gamitude/compose/$NAME 2>/dev/null
echo "folder changed exit code $?"
docker-compose down 2>/dev/null
echo "docker compose down exit code $?"
docker-compose up -d 2>/dev/null
echo "docker compose up exit code $?"

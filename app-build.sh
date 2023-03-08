#!/bin/bash
sudo mkdir -p /data/logs/spring/${HOSTNAME}
sudo chown -R ubuntu:ubuntu /data

./gradlew build

cp ./build/libs/library-react-SNAPSHOT.jar /data/library-react.jar

#!/bin/bash

# install jdk
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk

# install node
wget -c https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.gz && tar xzv -f node-v18.13.0-linux-x64.tar.gz
sudo cp -r ./node-v18.13.0-linux-x64/* /usr

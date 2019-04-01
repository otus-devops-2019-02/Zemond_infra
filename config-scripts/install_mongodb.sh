#!/bin/bash

#Add key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

#Install mongodb
sudo apt update &&
sudo apt install -y mongodb-org

#Start and add to auto start
sudo systemctl start mongod
sudo systemctl enable mongod

#Test
sudo systemctl status mongod

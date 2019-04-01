#!/bin/bash

#Start block of install ruby
sudo apt update &&
sudo apt install -y ruby-full ruby-bundler build-essential

ruby -v
bundler -v

#Start block of install mongodb
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

#Start block of install and set app
#Copy code from git
cd
git clone -b monolith https://github.com/express42/reddit.git

#Install dependence
cd reddit && bundle install

#Start server puma
puma -d

#Test
ps aux | grep puma

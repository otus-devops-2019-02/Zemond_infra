#!/bin/bash

#Copy code from git
cd
git clone -b monolith https://github.com/express42/reddit.git

#Install dependence
cd reddit && bundle install

#Start server puma
puma -d

#!/usr/bin/env bash

# MongoDB for Ubuntu 16.04
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt update
sudo apt-get install -y mongodb-org=3.2.11 mongodb-org-server=3.2.11 mongodb-org-shell=3.2.11 mongodb-org-mongos=3.2.11 mongodb-org-tools=3.2.11
sudo systemctl start mongod
sudo systemctl enable mongod

# Meteor 1.3.5.1
mkdir ~/repos
cd ~/repos
git clone --recursive https://github.com/meteor/meteor.git -b release-1.3.5
sudo ln -s ~/repos/meteor/meteor /usr/local/bin/meteor

# Download Wekan
git clone https://github.com/wekan/wekan
cd wekan

#### OPTIONAL: test pull request
## git checkout -b dwrensha-profile-bugfix devel
## git pull https://github.com/dwrensha/wekan.git profile-bugfix

# Install Node.js 0.10.48
sudo apt install build-essential nodejs nodejs-legacy npm git curl
npm install n
## if the previous fails (and asks you to run as sudo) just rm /home/<username>/node_modules and retry
n 0.10.48
npm install npm@latest
npm install node-gyp
npm install fibers

# install wekan npm dependancies
npm install

meteor
#!/bin/bash

GMOCK="gmock-1.7.0"
LIB_DIR="lib"
GMOCK_DIR="$LIB_DIR/$GMOCK"
GMOCK_ZIP="${GMOCK}.zip"
GMOCK_ZIP_URL="https://googlemock.googlecode.com/files/${GMOCK_ZIP}"

# installing dependencies
# to install-cmake follow the ref: http://www.claudiokuenzler.com/blog/611/installing-cmake-3.4.1-ubuntu-14.04-trusty-using-alternatives#.VuBStIUrLRY
sudo apt-get update
echo ">> installing gcc/g++/gdb ...."
sudo apt-get install gcc --assume-yes
sudo apt-get install build-essential --assume-yes
echo ">> installing lcov ...."
sudo apt-get install lcov --assume-yes
echo ">> installing cmake ...."
sudo apt-get install cmake --assume-yes
echo ">> installing python with pip ...."
sudo apt-get install python --assume-yes
sudo apt-get install python-pip --assume-yes
echo ">> installing gcovr ...."
sudo pip install gcovr
echo ">> installing java7 jdk ...."
sudo apt-get install default-jdk --assume-yes
echo ">> installing jenkins ...."
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins --assume-yes

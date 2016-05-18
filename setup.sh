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
sudo apt-get install jenkins

function setup_build_directory()
{
    build_name=$1
    dir_name=$(echo $build_name | tr '[:upper:]' '[:lower:]')
    if [ ! -d "$dir_name" ]; then
        echo ">> creating $dir_name directory..."
        mkdir $dir_name
    fi
    echo ">> running cmake in ${dir_name}..."
    cd $dir_name 
    if ! cmake .. -DCMAKE_BUILD_TYPE=$build_name \
                  -DGMOCK_ROOT=$GMOCK_DIR > /dev/null; then
        echo ">> error running cmake!"
        exit 1
    fi
    cd ..
}

function setup_gmock()
{
    if [ ! -d "$GMOCK_DIR" ]; then
        echo ">> downloading gmock..."
        cd "$LIB_DIR"
        if ! wget $GMOCK_ZIP_URL > /dev/null; then
            echo ">> error running wget!"
            exit 1
        fi
        echo ">> uncompressing zip..."
        if ! unzip $GMOCK_ZIP > /dev/null; then
            echo ">> error running unzip!"
            exit 1
        fi
        cd ..
    fi
}

setup_gmock
setup_build_directory "Debug"
#setup_build_directory "Release"

exit 0

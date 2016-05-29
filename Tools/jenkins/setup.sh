#!/bin/bash

echo ">> navigating to parent-directory ..."
#keep admin mode active
#sudo -s -H
cd ..
cd ..
echo ">> preparing build directory ..."
LIB_DIR="Tools"
GTEST="googletest-release-1.7.0"
GTEST_DIR="$LIB_DIR/$GTEST"
GTEST_LIBRARIES="$LIB_DIR/$GTEST/make"
GTEST_ZIP="${GTEST}.zip"
GTEST_ZIP_URL="https://googlemock.googlecode.com/files/${GTEST_ZIP}"

# installing dependencies
# call install.sh

function setup_build_directory()
{
    build_name=$1
    dir_name=$(echo $build_name | tr '[:upper:]' '[:lower:]')
    sudo rm -r "$dir_name" 
    if [ ! -d "$dir_name" ]; then
        echo ">> creating $dir_name directory..."
        mkdir $dir_name
    fi
    echo ">> copying gcovr to $dir_name directory..."
    cp "$LIB_DIR/gcovr" "$dir_name/gcovr"    
    echo ">> running cmake in ${dir_name}..."
    cd $dir_name 
    if ! cmake .. -DCMAKE_BUILD_TYPE=$build_name \
                  -DGTEST_ROOT=$GTEST_DIR \
                  -DGTEST_LIBRARIES=$GTEST_LIBRARIES > /dev/null; then
        echo ">> error running cmake!"
        exit 1
    fi
    sudo make clean
    sudo make all    
    cd ..
    
}

function setup_gtest()
{
    if [ ! -d "$GTEST_DIR" ]; then
        echo ">> downloading GTEST..."
        cd "$LIB_DIR"
        if ! wget $GTEST_ZIP_URL > /dev/null; then
            echo ">> error running wget!"
            exit 1
        fi
        echo ">> uncompressing zip..."
        if ! unzip $GTEST_ZIP > /dev/null; then
            echo ">> error running unzip!"
            exit 1
        fi
        cd ..
    fi
}

setup_gtest
setup_build_directory "Debug"
#setup_build_directory "Release"

exit 0

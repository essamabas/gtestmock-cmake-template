#!/bin/bash

cd ..
cd ..
#sudo chmod -R 777 debug/
cd debug
echo ">> run compiled application ..."
if [ $# -eq 0 ]
  then
    echo "No filter-arguments supplied for gtest"
    sudo ./tests --gtest_output=xml:tests.junit.xml
  else
    echo "No filter-arguments supplied for gtest"
    sudo ./tests --gtest_output=xml:tests.junit.xml --gtest_filter=$1
fi
echo ">> generating coverage report ..."
#python gcovr -x -r .. -f".*src\\.*" > coverage.xml2
#python gcovr -x -r .. -e".+\.test\.cpp" > coverage.xml
python gcovr -x -r .. -e"test/*" -e"Tools/*"> coverage.xml
#
echo ">> running cpp-check on src ..."
#python gcovr -x -r .. -f".*src\\.*" > coverage.xml2
sudo cppcheck --enable=all --inconclusive --check-config --xml-version=2 ../src 2> cppcheck.xml
echo ">> moving files to build-number Report .."
#kdir ..\..\builds\%BUILD_NUMBER%\workspace-files
#opy *.xml ..\..\builds\%BUILD_NUMBER%\workspace-files\*.xml
#hdir /d %OLDDIR% &rem restore current directory

echo ">> compiling application ..."
cd ..
cd ..
cd debug
make clean
make all
echo ">> run compiled application ..."
if [ $# -eq 0 ]
  then
    echo "No filter-arguments supplied for gtest"
    sudo ./tests --gtest_output=xml:coverage.junit.xml
  else
    echo "No filter-arguments supplied for gtest"
    sudo ./tests --gtest_output=xml:coverage.junit.xml --gtest_filter=$1
fi
echo ">> generating coverage report ..."
#python gcovr -x -r .. -f".*src\\.*" > coverage.xml2
python gcovr -x -r .. -e".+\.test\.cpp" > coverage.xml
echo ">> moving files to build-number Report .."
#kdir ..\..\builds\%BUILD_NUMBER%\workspace-files
#opy *.xml ..\..\builds\%BUILD_NUMBER%\workspace-files\*.xml
#hdir /d %OLDDIR% &rem restore current directory

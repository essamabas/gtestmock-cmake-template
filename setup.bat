mkdir Debug
cd Debug 
cmake .. -DCMAKE_BUILD_TYPE=Debug -DGMOCK_ROOT=lib/googletest-release-1.7.0
make clean
make

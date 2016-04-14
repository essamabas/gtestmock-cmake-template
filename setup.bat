mkdir Debug
cd Debug 
cmake .. -DCMAKE_BUILD_TYPE=Debug -DGMOCK_ROOT=lib/gmock-1.7.0
make clean
make

cd lib/googletest-release-1.7.0/make
make clean
make
cd ..
cd ..
cd ..
mkdir Debug
cd Debug
cmake .. -DCMAKE_BUILD_TYPE=Debug -DGTEST_ROOT=lib/googletest-release-1.7.0
make

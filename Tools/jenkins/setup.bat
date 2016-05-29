echo "Add Cygwin and Python to PATH"
echo %PATH%
echo "Compile googletest and Link Library to PATH TODO"
set OLDDIR=%CD%
cd ..
cd googletest-release-1.7.0/make
make all
echo "Compile Project"
cd ..
cd ..
cd ..
cd Debug
make clean
make all
echo "Run Compiled Application"
TestGTestCygwin.exe --gtest_output=xml:coverage.junit.xml
echo "Generate Coverage Report"
python gcovr -x -r .. -f".*src\\.*" > coverage.xml
python gcovr -x -r .. -e".+\.src\\.*" > coverage2.xml
echo "Move files to build-number Report"
mkdir ..\..\builds\%BUILD_NUMBER%\workspace-files
copy *.xml ..\..\builds\%BUILD_NUMBER%\workspace-files\*.xml
chdir /d %OLDDIR% &rem restore current directory

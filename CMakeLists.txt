cmake_minimum_required(VERSION 2.8)
set(CMAKE_LEGACY_CYGWIN_WIN32 0)

project(my_project)

# General
###############################################################################
# Activate C++0x support (if you encounter gmock errors, use 1.6.0 version)
add_definitions(-std=c++0x)

# Extra warnings
add_definitions(-Wextra)

# Google Test
###############################################################################
add_subdirectory(${GTEST_ROOT})
enable_testing()
#find_package(GTest REQUIRED)
#include_directories(${GTEST_INCLUDE_DIRS})
#include_directories(${GTEST_ROOT}/gtest/include)
include_directories(${GTEST_ROOT}/include)

# Main program executable
###############################################################################
set(EXECUTABLE_NAME "program")

# Source files
file(GLOB SRC_FILES "src/*.cpp")

# Executable dependencies
if(SRC_FILES)
    add_executable("${EXECUTABLE_NAME}" ${SRC_FILES}) 
endif(SRC_FILES)

# Set link libraries
# target_link_libraries($EXECUTABLE_NAME ...)

# Tests executable
###############################################################################
set(TEST_EXECUTABLE_NAME "tests")

# Test files
file(GLOB TEST_FILES "test/*.cpp")

# Don't include Main.cpp from src
file(GLOB MAIN_SRC "src/Main.cpp")
list(REMOVE_ITEM SRC_FILES ${MAIN_SRC})

#set coverage flags to gcc 
# -ftest-coverage Create data files needed by "gcov"
# -fprofile-arcs Insert arc-based program profiling code
###############################################################################
SET(CMAKE_CXX_FLAGS="-g -O0 -Wall -W -Wshadow -Wunused-variable -Wunused-parameter -Wunused-function -Wunused -Wno-system-headers -Wno-deprecated -Woverloaded-virtual -Wwrite-strings -fprofile-arcs -ftest-coverage")
SET(CMAKE_C_FLAGS="-g -O0 -Wall -W -fprofile-arcs -ftest-coverage")
#SET(CMAKE_SHARED_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")
SET(CMAKE_EXE_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")

# Include CodeCoverage.cmake 
# Ref: https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake
###############################################################################
# sets module path for searching
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake-modules)
if((CMAKE_COMPILER_IS_GNUCXX) OR (CMAKE_COMPILER_IS_GNUCC))
    include(CodeCoverage)
    setup_target_for_coverage(${PROJECT_NAME}_coverage ${TEST_EXECUTABLE_NAME} coverage)
endif()


add_executable("${TEST_EXECUTABLE_NAME}" ${TEST_FILES} ${SRC_FILES})

# Set link libraries (order matters)
target_link_libraries("${TEST_EXECUTABLE_NAME}" gtest_main pthread gcov)
#target_link_libraries("${TEST_EXECUTABLE_NAME}" ${GTEST_LIBRARIES}/gtest_main.a pthread gcov)
#target_link_libraries(runTests ${GTEST_BOTH_LIBRARIES} pthread gcov)

# Include root directory
include_directories(BEFORE ".")
include_directories(BEFORE "src/")


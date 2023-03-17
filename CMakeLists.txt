cmake_minimum_required(VERSION 3.25.3)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

project(cpp-boilerplate VERSION "0.0.1" LANGUAGES CXX)

# CPM
include(cmake/CPM.cmake)

# googletest  (external dependency managed by CPM)
CPMAddPackage(
  NAME GoogleTest
  VERSION 1.13.0
  GITHUB_REPOSITORY "google/googletest"
  GIT_TAG "v1.13.0"
)

# boost  (system's)
find_package(Boost REQUIRED)

# clang-tidy
find_program(CLANG_TIDY_EXE NAMES "clang-tidy" REQUIRED)
set(CLANG_TIDY_COMMAND "${CLANG_TIDY_EXE}" "-checks=-*,modernize-*")

# build googletest / googlemock dependency
#add_subdirectory(googletest)

# main lib
add_library(mylib SHARED src/MyClass.cpp)
target_link_libraries(mylib PUBLIC boost_filesystem)
set_target_properties (mylib PROPERTIES SOVERSION ${PROJECT_VERSION})
set_target_properties(mylib PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")

# app
add_executable(app src/main.cpp )
target_link_libraries(app PUBLIC mylib pthread)

# test
add_executable(test test/MyClassTest.cpp)
target_link_libraries(test mylib gtest_main pthread) #gmock_main


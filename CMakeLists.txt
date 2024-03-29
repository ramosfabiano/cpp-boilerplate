cmake_minimum_required(VERSION 3.25)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)

project(cpp-boilerplate VERSION "0.0.1" LANGUAGES CXX)

# CPM
include(cmake/CPM.cmake)

# clang-tidy
find_program(CLANG_TIDY_EXE NAMES "clang-tidy" REQUIRED)
set(CLANG_TIDY_COMMAND "${CLANG_TIDY_EXE}" "-checks=-*,cppcoreguidelines-*,modernize-*")

# code coverage options
option(COVERAGE "Enable coverage reporting" OFF)
if(COVERAGE)
	add_compile_options(--coverage)
	add_link_options(--coverage)
endif()

# lib
add_subdirectory(mylib)

# app
add_subdirectory(myapp)

# tests
add_subdirectory(test)

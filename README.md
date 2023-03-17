# CPP boilerplate

This repository contains a simple boilerplate for C++ projects (under Linux).

It uses CMake, googletest and clang-tidy.

## Dependencies 

* cmake 
* make
* gcc/g++ 
* clang-tidy
* Boost

## Setup

This project depents on CMake-CPM module, under cmake/CPM.cmake (https://github.com/cpm-cmake/CPM.cmake). 

In order to update this component, run:

```
mkdir -p cmake
wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/CPM.cmake
```

Alternatively, CPM provides a 'proxy' CPM.cmake that checks and updates the CPM.cmake version on every build. In order to use this proxy, run this instead:

```
mkdir -p cmake
wget -O cmake/CPM.cmake https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/get_cpm.cmake
```

## Compiling / Testing (manually)

To compile the project, first, create a `build` directory and change to that directory:
```
mkdir build && cd build
```

From within the `build` directory, then run `cmake` and `make` as follows:
```
cmake ..
make
```

Then, in order to run the tests, from within the `build` directory:

```
cd tests
ctest --output-on-failure
```


## Compiling / Testing (via helper script)

To compile the project, run the `build.sh` script:

```
./build.sh <option> <option> ...
```
Supported options are `Clean`, `Test`, `Release` and `Debug`. 

The following command cleans the build folder, runs a Release build, and finally run the tests:

```
./build.sh Clean Release Test
```



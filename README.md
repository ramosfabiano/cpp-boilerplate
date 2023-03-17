# CPP boilerplate

This repository contains a simple boilerplate for C++ projects (under Linux).

It uses CMake, googletest and clang-tidy.

## Dependencies 

* cmake 
* make or ninja
* gcc/g++ 
* clang (for clang-tidy & clang-format)
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

## Compiling

To compile the project, first, create a `build` directory and change to that directory:
```
mkdir build && cd build
```
From within the `build` directory, then run `cmake` and `ninja` as follows:
```
cmake ..
ninja
```
The executable will be placed in the `build` directory.

## Testing

The testing executable is also placed in the `build` directory. From within `build`, you can run the unit tests as follows:
```
./test
```


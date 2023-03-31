# C++ boilerplate

This repository contains a simple boilerplate for C++ projects (under Linux).

It uses CMake, googletest, clang-format and clang-tidy.

## Dependencies 

* make
* cmake 
* gcc/g++ 
* clang-format
* clang-tidy
* boost


## Building

To build the project:
```
make all
```

The source files will automatically be formatted by `clang-format` before building.

Alternativelly, a debug build can be triggered using:

```
make debug
```

## Testing

In order to run the tests:

```
make test
```

## CPM

This project depents on [CMake-CPM](https://github.com/cpm-cmake/CPM.cmake) module, bundled in as cmake/CPM.cmake. 

In order to update this component, run:

```
make cpm
```

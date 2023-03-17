#!/bin/bash

for cppfile in $(find src/*.?pp) ; do
    clang-format --style=gnu -i $cppfile
done

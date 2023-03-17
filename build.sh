#!/bin/bash


mkdir -p build && \
pushd build && \
cmake -DCMAKE_BUILD_TYPE:STRING=Release -G Ninja .. && \
ninja -v -j4 && \
popd



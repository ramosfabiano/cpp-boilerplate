build_dir=${PWD}/build
install_dir=${PWD}/install

#build_system="Ninja"
#build_command="ninja"
build_system="Unix Makefiles"
build_command="make"

build_threads=4


.PHONY: all
all:
	mkdir -p ${build_dir}
	mkdir -p ${install_dir}
	cd ${build_dir} && \
	cmake -DCMAKE_BUILD_TYPE:STRING=Release -G ${build_system} -DCMAKE_INSTALL_PREFIX=${install_dir} .. && \
	${build_command} -j${build_threads} install


.PHONY: debug
debug:
	mkdir -p ${build_dir}
	mkdir -p ${install_dir}
	cd ${build_dir} && \
	cmake -DCMAKE_BUILD_TYPE:STRING=Debug -G ${build_system} -DCMAKE_INSTALL_PREFIX=${install_dir} .. && \
	${build_command} -j${build_threads} install


.PHONY: clean
clean:
	rm -rf ${build_dir}
	rm -rf ${install_dir}


.PHONY: test
test:
	cd ${build_dir}/test && \
	ctest --output-on-failure


.PHONY: format
format:
	clang-format -style=gnu -i myapp/src/*.?pp
	clang-format -style=gnu -i myapp/include/*.?pp
	clang-format -style=gnu -i mylib/src/*.?pp
	clang-format -style=gnu -i mylib/include/*.?pp
	clang-format -style=gnu -i test/*.?pp


.PHONY: cpm
cpm:
	mkdir -p cmake && \
	wget https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/CPM.cmake -O cmake/CPM.cmake 

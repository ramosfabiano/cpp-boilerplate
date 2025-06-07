build_dir=${PWD}/build
install_dir=${PWD}/install

build_system="Ninja"
build_command="ninja"
#build_system="Unix Makefiles"
#build_command="make"

build_threads=$(shell nproc)

.PHONY: *
.ONE_SHELL:

build:
	mkdir -p ${build_dir}
	mkdir -p ${install_dir}
	cd ${build_dir} && \
	cmake -DCMAKE_BUILD_TYPE:STRING=Release -G ${build_system} -DCMAKE_INSTALL_PREFIX=${install_dir} .. && \
	${build_command} -j${build_threads} install

build_debug:
	mkdir -p ${build_dir}
	mkdir -p ${install_dir}
	cd ${build_dir} && \
	cmake -DCMAKE_BUILD_TYPE:STRING=Debug -G ${build_system} -DCMAKE_INSTALL_PREFIX=${install_dir} .. && \
	${build_command} -j${build_threads} install

run: build
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./install/lib/ ./install/bin/myapp


clean:
	rm -rf ${build_dir}
	rm -rf ${install_dir}


test: clean build_debug
	cd ${build_dir}/test && \
	ctest --output-on-failure && \
	cd ${build_dir} && \
	mkdir -p coverage_report && \
	lcov --capture --directory . --output-file coverage.info_ && \
	lcov --remove coverage.info_ '*google*' '/usr*' --output-file coverage.info > /dev/null && \
	genhtml coverage.info --output-directory coverage_report && \
	echo "Please check 'build/coverage_report/index.html' for full coverage report."


format:
	find myapp/ -name  *.?pp  -exec clang-format -i --style="{BasedOnStyle: google, IndentWidth: 4, TabWidth: 4, ColumnLimit: 150}" {} \;
	find mylib/ -name  *.?pp  -exec clang-format -i --style="{BasedOnStyle: google, IndentWidth: 4, TabWidth: 4, ColumnLimit: 150}" {} \;
	find test/ -name  *.?pp  -exec clang-format -i --style="{BasedOnStyle: google, IndentWidth: 4, TabWidth: 4, ColumnLimit: 150}" {} \;
	
update-cpm:
	mkdir -p cmake && \
	wget https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/CPM.cmake -O cmake/CPM.cmake 

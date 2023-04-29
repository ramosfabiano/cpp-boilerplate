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


.PHONY: format
format:
	find myapp/ -name  *.?pp | xargs astyle -n --style=allman --add-braces --convert-tabs --indent-cases --pad-oper
	find mylib/ -name  *.?pp | xargs astyle -n --style=allman --add-braces --convert-tabs --indent-cases --pad-oper
	find test/ -name  *.?pp  | xargs astyle -n --style=allman --add-braces --convert-tabs --indent-cases --pad-oper


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


.PHONY: cpm
cpm:
	mkdir -p cmake && \
	wget https://github.com/cpm-cmake/CPM.cmake/releases/latest/download/CPM.cmake -O cmake/CPM.cmake 

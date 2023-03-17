#!/bin/bash

build_dir=./build

# Ninja
build_system="-G Ninja"
build_command="ninja"

# Makefiles
#build_system="-G Unix Makefiles"
#build_command="make"

function build_configuration
{
   	BUILD_TYPE="$1"

    mkdir -p "$build_dir" && \
    pushd "$build_dir" > /dev/null && \
    cmake -DCMAKE_BUILD_TYPE:STRING=$BUILD_TYPE "$build_system" .. && \
    "$build_command" -j4 && \
    popd > /dev/null

}

function run_tests
{
    test_directory="$build_dir/test"
    if [ -d "$test_directory" ]
    then
		pushd $test_directory > /dev/null
        ctest --output-on-failure
		popd  > /dev/null
    else
        echo -e "Test directory not found. Please build first."
    fi
}

function run_command 
{
	CMD="$1"

	case "$CMD" in
		"Clean")
			rm -rf "$build_dir"	
			;;   
		"Test")
            run_tests
			;;
		"Release")
			build_configuration "Release"
			;;
		"Debug")
			build_configuration "Debug"
			;;
		*) 
			echo -e "<<<<<<<< Unkown command: $CMD\n"
			;;	
	esac	
}

function display_usage 
{
	echo -e "\nUsage:\n$0 [args]\n" 
	echo -e "Valid Args: \nClean, Debug, Release, Test\n"
	echo -e "Examples:"
	echo -e "$0 Clean"
	echo -e "$0 Clean Release"    
	echo -e "$0 Release Test"
	echo -e "$0 Clean Debug Test"
	echo -e "\n"
}

#
# main
#
if [  $# -gt 0 ]
then
	for CMD in "$@"
	do	
		run_command	"$CMD"		
	done
else
	display_usage
fi


add_executable(myapp main.cpp )
target_link_libraries(myapp PUBLIC ${MYLIB_LIBRARY_NAME} pthread)
set_target_properties(myapp PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")


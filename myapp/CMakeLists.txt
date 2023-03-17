add_executable(myapp main.cpp )
target_link_libraries(myapp PUBLIC ${MYLIB_LIBRARY_NAME} pthread)


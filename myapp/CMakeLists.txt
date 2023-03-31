set(MYAPP_EXECUTABLE_NAME myapp)

add_executable(${MYAPP_EXECUTABLE_NAME} src/main.cpp )
target_link_libraries(${MYAPP_EXECUTABLE_NAME} PUBLIC mylib pthread)
set_target_properties(${MYAPP_EXECUTABLE_NAME} PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")


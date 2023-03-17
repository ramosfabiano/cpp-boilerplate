
include (CTest)

# googletest
CPMAddPackage(
  NAME GoogleTest
  VERSION 1.13.0
  GITHUB_REPOSITORY "google/googletest"
  GIT_TAG "v1.13.0"
)

add_executable(mytest MyClassTest.cpp)
target_link_libraries(mytest mylib gtest_main pthread) #gmock_main

add_test(NAME basic_test 
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMAND ${CMAKE_CURRENT_BINARY_DIR}/mytest)

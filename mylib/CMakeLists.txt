
# boost (from system)
find_package(Boost REQUIRED)

add_library(${MYLIB_LIBRARY_NAME} SHARED src/MyClass.cpp)
target_include_directories(${MYLIB_LIBRARY_NAME} PUBLIC include)
target_link_libraries(${MYLIB_LIBRARY_NAME} PUBLIC boost_filesystem)
set_target_properties (${MYLIB_LIBRARY_NAME} PROPERTIES SOVERSION ${PROJECT_VERSION})
set_target_properties(${MYLIB_LIBRARY_NAME} PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")


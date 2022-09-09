cmake_minimum_required(VERSION 3.16)
project(cmake_module)

set(CMAKE_CXX_STANDARD 20)

list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_SOURCE_DIR}/cmake)

include(CTest)
set(BUILD_TESTING ON)
add_subdirectory(tests)

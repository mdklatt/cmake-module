cmake_minimum_required(VERSION 3.16)
project(cmake_modules
LANGUAGES C CXX Fortran
)

set(CMAKE_CXX_STANDARD 20)

list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_SOURCE_DIR}/cmake)

include(CTest)
add_subdirectory(tests)

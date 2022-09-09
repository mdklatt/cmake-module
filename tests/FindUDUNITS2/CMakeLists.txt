project(FindUDUNITS2 LANGUAGES CXX)

find_package(UDUNITS2)

set(CMAKE_BUILD_TYPE Debug)
set(exe test_udunits2)

add_executable(${exe} test_udunits2.cpp)
target_link_libraries(${exe} PRIVATE UDUNITS2::udunits2)

add_test(
    NAME "${exe}"
    COMMAND "${exe}"
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)

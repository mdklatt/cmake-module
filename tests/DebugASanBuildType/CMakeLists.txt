project(DebugASanBuildType LANGUAGES C CXX)

include(DebugASanBuildType)

set(CMAKE_BUILD_TYPE DebugASan)

add_executable(test_asan_c test_asan_c.c)

add_executable(test_asan_cxx test_asan_cxx.cpp)

foreach(exe test_asan_c test_asan_cxx)
    # Add each test executable to the CTest configuration.
    add_test(
        NAME "${exe}"
        COMMAND "${exe}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    )
    set_tests_properties("${exe}" PROPERTIES
        # Expecting ASan to report leaks in the test executables.
        PASS_REGULAR_EXPRESSION "ERROR: LeakSanitizer"
    )
endforeach()

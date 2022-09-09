find_package(NetCDF REQUIRED COMPONENTS CXX)

add_executable(test_netcdf_cxx test_netcdf_cxx.cpp)
target_link_libraries(test_netcdf_cxx PRIVATE ${NETCDF_LIBRARIES})

foreach(exe test_netcdf_cxx)
    # Add each test executable to the CTest configuration.
    add_test(
        NAME "${exe}"
        COMMAND "${exe}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    )
endforeach()

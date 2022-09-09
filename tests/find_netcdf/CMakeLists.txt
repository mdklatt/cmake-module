project(find_netcdf LANGUAGES C CXX Fortran)
find_package(NetCDF REQUIRED COMPONENTS C CXX)


add_executable(test_netcdf_c test_netcdf_c.c)
target_link_libraries(test_netcdf_c PRIVATE ${NETCDF_LIBRARIES})

add_executable(test_netcdf_cxx test_netcdf_cxx.cpp)
target_link_libraries(test_netcdf_cxx PRIVATE ${NETCDF_LIBRARIES})


foreach(exe test_netcdf_c test_netcdf_cxx)
    # Add each test executable to the CTest configuration.
    add_test(
        NAME "${exe}"
        COMMAND "${exe}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    )
endforeach()

project(FindNetCDF LANGUAGES C CXX Fortran)
find_package(NetCDF REQUIRED COMPONENTS CXX F90 F77)

set(CMAKE_BUILD_TYPE Debug)

add_executable(test_netcdf_c test_netcdf_c.c)
target_link_libraries(test_netcdf_c PRIVATE NetCDF::netcdf)

add_executable(test_netcdf_cxx test_netcdf_cxx.cpp)
target_link_libraries(test_netcdf_cxx PRIVATE NetCDF::netcdf)

add_executable(test_netcdf_f90 test_netcdf_f90.f90)
target_link_libraries(test_netcdf_f90 PRIVATE NetCDF::netcdf)

add_executable(test_netcdf_f77 test_netcdf_f77.f)
target_link_libraries(test_netcdf_f77 PRIVATE NetCDF::netcdf)


foreach(exe test_netcdf_c test_netcdf_cxx test_netcdf_f90 test_netcdf_f77)
    # Add each test executable to the CTest configuration.
    add_test(
        NAME "${exe}"
        COMMAND "${exe}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    )
endforeach()

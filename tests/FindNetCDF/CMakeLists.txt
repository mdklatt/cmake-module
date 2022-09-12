project(FindNetCDF LANGUAGES C CXX Fortran)
find_package(NetCDF REQUIRED COMPONENTS CXX F90 F77)

set(CMAKE_BUILD_TYPE Debug)

# Test properties of the all-inclusive target.

get_target_property(prop NetCDF::netcdf INTERFACE_INCLUDE_DIRECTORIES)
if(NOT "${prop}" STREQUAL "${NetCDF_INCLUDE_DIRS}")
    message(FATAL_ERROR "Unexpected value for NetCDF_INCLUDE_DIRS")
endif()
get_target_property(prop NetCDF::netcdf INTERFACE_LINK_LIBRARIES)
if(NOT "${prop}" STREQUAL "${NetCDF_LIBRARIES}")
    message(FATAL_ERROR "Unexpected value for NetCDF_LIBRARIES")
endif()


# Verify that language-specific targets work.

add_executable(test_netcdf_c test_netcdf_c.c)
target_link_libraries(test_netcdf_c PRIVATE NetCDF::netcdf-c)

add_executable(test_netcdf_cxx test_netcdf_cxx.cpp)
target_link_libraries(test_netcdf_cxx PRIVATE NetCDF::netcdf-cxx)

add_executable(test_netcdf_f90 test_netcdf_f90.f90)
target_link_libraries(test_netcdf_f90 PRIVATE NetCDF::netcdf-f90)

add_executable(test_netcdf_f77 test_netcdf_f77.f)
target_link_libraries(test_netcdf_f77 PRIVATE NetCDF::netcdf-f77)


foreach(exe test_netcdf_c test_netcdf_cxx test_netcdf_f90 test_netcdf_f77)
    # Add each test executable to the CTest configuration.
    add_test(
        NAME "${exe}"
        COMMAND "${exe}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    )
endforeach()

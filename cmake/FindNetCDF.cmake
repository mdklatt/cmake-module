##
# Find v4 of the NetCDF library.
# <https://www.unidata.ucar.edu/software/netcdf>
#
# The package provides support for multiple languages via COMPONENTS (the core
# C libraries are always required and included by default): `CXX` (C++),
# `F77`, and `F90`.
#
# The package exports the NetCDF::netcdf target and defines these standard
# standard package variables:
#   - NetCDF_FOUND
#   - NetCDF_INCLUDE_DIRS
#   - NetCDF_LIBRARIES
#   - NetCDF_VERSION (optional)
#
# There are also language-specific definitions:
#   - NetCDF::netcdf-<lang>
#   - NetCDF_<LANG>_FOUND
#   - NetCDF_<LANG>_INCLUDE_DIRS
#   - NetCDF_<LANG>_LIBRARIES
#
# <https://github.com/mdklatt/cmake-module>
##
set(package NetCDF)


# Attempt to use `pkg-config` first to locate the library in case it provides
# its own .pc file. These variables will be then be used as hints to find the
# individual components.

find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
    # In addition to the usual variables, this sets <prefix>_LIBRARY_DIRS,
    # which is useful in case the library is installed to a non-standard
    # location.
    # TODO: Beware, this is untested.
    message(STATUS "Using pkg-config values for ${package}")
    pkg_check_modules(${package}_PC QUIET netcdf)
endif()


mark_as_advanced(
    ${package}_FOUND
    ${package}_INCLUDE_DIRS
    ${package}_LIBRARIES
    ${package}_VERSION
)

# Enable support for each requested language. The core C library is required
# for every language and is included by default.
list(APPEND ${package}_FIND_COMPONENTS "C")
foreach(lang C CXX F77 F90)  # C must always be first
    # Set language variables.
    list(FIND ${package}_FIND_COMPONENTS ${lang} index)
    if(index EQUAL -1)
        set(${package}_${lang}_FOUND} 0)
        continue()
    else()
        set(${package}_${lang}_FOUND} 1)
    endif()
    message(STATUS "Enabling ${package} support for ${lang}")
    if(${lang} STREQUAL "C")
        set(header netcdf.h)
        set(library netcdf)
    elseif(${lang} STREQUAL "CXX")
        # Older distributions use <netcdfcpp.h> instead of <netcdf>.
        set(header netcdf netcdfcpp.h)
        set(library netcdf_c++4)
    elseif(${lang} STREQUAL "F77")
        set(header netcdf.inc)
        set(library netcdff)
    elseif(${lang} STREQUAL "F90")
        set(header netcdf.mod)
        set(library netcdff)
    endif()
    find_path(${package}_${lang}_INCLUDE_DIRS
        NAMES ${header}  # match any of the listed names
        HINTS ${package}_PC_INCLUDE_DIRS
    )
    find_library(${package}_${lang}_LIBRARIES
        NAMES ${library}  # match any of the listed names
        HINTS ${package}_PC_LIBRARY_DIRS
    )
    if(NOT ${package}_${lang}_INCLUDE_DIRS OR NOT ${package}_${lang}_LIBRARIES)
        set(${package}_${lang}_FOUND 0)
    endif()
    list(APPEND ${package}_${lang}_INCLUDE_DIRS "${${package}_C_INCLUDE_DIRS}")
    list(REMOVE_DUPLICATES ${package}_${lang}_INCLUDE_DIRS)
    list(APPEND ${package}_INCLUDE_DIRS "${${package}_${lang}_INCLUDE_DIRS}")
    list(APPEND ${package}_${lang}_LIBRARIES "${${package}_C_LIBRARIES}")
    list(REMOVE_DUPLICATES ${package}_${lang}_LIBRARIES)
    list(APPEND ${package}_LIBRARIES "${${package}_${lang}_LIBRARIES}")
    mark_as_advanced(
        ${package}_${lang}_FOUND
        ${package}_${lang}_INCLUDE_DIRS
        ${package}_${lang}_LIBRARIES
    )

    # Export component targets.
    string(TOLOWER ${lang} lang_lc)
    set(target ${package}::netcdf-${lang_lc})
    if(NOT TARGET ${target})
        add_library(${target} INTERFACE IMPORTED)
        set_target_properties(${target} PROPERTIES
            # TODO: Need to verify that netCDF doesn't require any special compiler flags.
            INTERFACE_INCLUDE_DIRECTORIES "${${package}_${lang}_INCLUDE_DIRS}"
            INTERFACE_LINK_LIBRARIES "${${package}_${lang}_LIBRARIES}"
        )
    endif()

endforeach()


# Set standard package variables.

list(REMOVE_DUPLICATES ${package}_INCLUDE_DIRS)
list(REMOVE_DUPLICATES ${package}_LIBRARIES)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(${package}
    REQUIRED_VARS
        # Set ${package}_FOUND if all these variables are set.
        ${package}_INCLUDE_DIRS
        ${package}_LIBRARIES
    VERSION_VAR ${package}_VERSION
)

mark_as_advanced(
    ${package}_FOUND
    ${package}_INCLUDE_DIRS
    ${package}_LIBRARIES
    ${package}_VERSION
)


# Export the all-inclusive package target.

set(target ${package}::netcdf)
if(NOT TARGET ${target})
    add_library(${target} INTERFACE IMPORTED)
    set_target_properties(${target} PROPERTIES
        # TODO: Need to verify that netCDF doesn't require any special compiler flags.
        INTERFACE_INCLUDE_DIRECTORIES "${${package}_INCLUDE_DIRS}"
        INTERFACE_LINK_LIBRARIES "${${package}_LIBRARIES}"
    )
endif()

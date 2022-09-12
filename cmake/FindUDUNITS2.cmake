##
# Find v2 of the UDUNITS library.
# <https://www.unidata.ucar.edu/software/udunits/https://www.unidata.ucar.edu/software/udunits>
#
# The package exports the UDUNITS2::udunits2 target and defines these standard
# package variables:
#   - UDUNITS2_FOUND
#   - UDUNUITS2_INCLUDE_DIRS
#   - UDUNITS2_LIBRARIES
#   - UDUNITS_VERSION (optional)
#
# <https://github.com/mdklatt/cmake-module>
##
set(package UDUNITS2)

# Attempt to use `pkg-config` first to locate the library in case it provides
# its own .pc file.

find_package(PkgConfig)
if(PKG_CONFIG_FOUND)
    # In addition to the usual variables, this sets <prefix>_LIBRARY_DIRS,
    # which is useful in case the library is installed to a non-standard
    # location.
    # TODO: Beware, this is untested.
    message(STATUS "Using pkg-config values for ${package}")
    pkg_check_modules(${package} QUIET UDUNITS2)
endif()


# Find the library manually.

if(NOT ${package}_FOUND)
    find_path(${package}_INCLUDE_DIRS NAMES udunits2.h)
    find_library(${package}_LIBRARIES udunits2)
endif()

mark_as_advanced(
    ${package}_FOUND
    ${package}_INCLUDE_DIRS
    ${package}_LIBRARIES
    ${package}_LIBRARY_DIRS
    ${package}_VERSION
)


# Set standard package variables.

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(${package}
    REQUIRED_VARS
        # Set ${package}_FOUND if all these variables are set.
        ${package}_INCLUDE_DIRS
        ${package}_LIBRARIES
    VERSION_VAR ${package}_VERSION
)

# Export package targets.

set(target ${package}::udunits2)
if(${package}_FOUND AND NOT TARGET ${target})
    message(STATUS "Defining target ${target}")
    add_library(${target} INTERFACE IMPORTED)
    set_target_properties(${target} PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${${package}_INCLUDE_DIRS}"
        INTERFACE_LINK_LIBRARIES "${${package}_LIBRARIES}"
        INTERFACE_LIBRARY_DIRS "${${package}_LIBRARY_DIRS}"  # set by pkg_check_modules()
    )
endif()

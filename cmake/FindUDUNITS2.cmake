find_package(PkgConfig)
pkg_check_modules(PC_UDUNITS2 QUIET UDUNITS2)


find_path(UDUNITS2_INCLUDE_DIR
    NAMES udunits2.h
    PATHS ${PC_UDUNITS2_INCLUDE_DIRS}
)

find_library(UDUNITS2_LIBRARY
    udunits2
    PATHS ${PC_UDUNITS2_LIBRARIES}
)

set(UDUNITS2_VERSION ${PC_UDUNITS2_VERSION})

mark_as_advanced(UDUNITS2_FOUND UDUNITS2_INCLUDE_DIR UDUNITS2_VERSION)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(UDUNITS2
    REQUIRED_VARS  # set UDUNITS_FOUND only if all these files were found
        UDUNITS2_INCLUDE_DIR
        UDUNITS2_LIBRARY
    VERSION_VAR UDUNITS2_VERSION
)

if(UDUNITS2_FOUND AND NOT TARGET UDUNITS2::udunits2)
    add_library(UDUNITS2::udunits2 INTERFACE IMPORTED)
    set_target_properties(UDUNITS2::udunits2 PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${UDUNITS2_INCLUDE_DIR}"
            INTERFACE_LINK_LIBRARIES "${UDUNITS2_LIBRARY}"
            )
endif()

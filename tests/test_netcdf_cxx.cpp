/**
 * Use the netCDF C++ library.
 */
#include <cstdlib>
#include <cassert>
#include <netcdf>


/**
 * Application entry point.
 *
 * @return exit status (0 for success)
 */
int main() {
    netCDF::NcVar var;
    assert(var.isNull());
    return EXIT_SUCCESS;
}

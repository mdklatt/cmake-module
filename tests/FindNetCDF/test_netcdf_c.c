/**
 * Test the availability of the netCDF C library.
 */
#include <stdlib.h>
#include <assert.h>
#include <netcdf.h>


/**
 * Application entry point.
 *
 * @return exit status (0 for success)
 */
int main(void) {
    assert(nc_close(-1) == NC_EBADID);
    return EXIT_SUCCESS;
}

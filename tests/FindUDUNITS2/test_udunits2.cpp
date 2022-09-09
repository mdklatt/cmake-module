/**
 * Test the availability of the UDUNITS2 library.
 */
#include <cstdlib>
#include <cassert>
#include <memory>
#include <udunits2.h>


/**
 * Application entry point.
 *
 * @return exit status (0 for success)
 */
int main() {
    ut_system* units{nullptr};
    try {
        units = ut_read_xml(nullptr);
        assert(ut_get_unit_by_name(units, "meter"));
    }
    catch (...) {
        ut_free_system(units);
    }
    return EXIT_SUCCESS;
}

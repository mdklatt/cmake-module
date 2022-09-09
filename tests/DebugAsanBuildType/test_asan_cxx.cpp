/**
 * Test that the DebugASan build type is used.
 */
#include <cstdlib>
#include <cassert>

/**
 * Application entry point.
 *
 * @return exit status (0 for success)
 */
int main() {
    // Intentional memory leak so that AddressSanitizer reports an error.
    const auto ptr{new int};
    assert(ptr);
    return EXIT_SUCCESS;  // ASan will override with an error status
}

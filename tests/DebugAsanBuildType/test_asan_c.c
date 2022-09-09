/**
 * Test that the DebugASan build type is used.
 */
#include <stdlib.h>
#include <assert.h>
#include <malloc.h>


/**
 * Application entry point.
 *
 * @return exit status (0 for success)
 */
int main(void) {
    // Intentional memory leak so that AddressSanitizer reports an error.
    const int* ptr = malloc(sizeof(int));
    assert(ptr);
    return EXIT_SUCCESS;  // ASAN will override with an error status
}

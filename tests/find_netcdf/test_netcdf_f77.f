C Test the availability of the NetCDF F77 library.
        program testnc
        implicit none
        include "netcdf.inc"

        if (nf_close(-1) .ne. nf_ebadid) then
            stop 1
        end if

        end program

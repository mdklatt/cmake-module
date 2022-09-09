program test_netcdf_f90

    use netcdf
    implicit none

    integer :: ncerr

    if (nf90_close(-1) /= NF90_EBADID) then
        call exit(1)
    end if

end program

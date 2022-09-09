============
cmake-module
============

Find Modules
============

A `find module`_ is used with ``find_package()`` to find system libraries and
utilities. These use "modern CMake" and support exported targets and COMPONENTS
where appropriate. Install by placing the module file somewhere in
`CMAKE_MODULE_PATH`_.

FindNetCDF.cmake
----------------
Find the installed `NetCDF`_ libraries, with language support for C, C++, and
Fortran.



Testing
=======

A Docker image is used to test the modules.

.. code-block:: console

    $ make dev test


.. _find module: https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html#find-modules
.. _CMAKE_MODULE_PATH: https://cmake.org/cmake/help/latest/variable/CMAKE_MODULE_PATH.html
.. _NetCDF: https://www.unidata.ucar.edu/software/netcdf

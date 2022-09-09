============
cmake-module
============

|license|
|tests|


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


.. |license| image:: https://img.shields.io/github/license/mdklatt/httpexec
    :alt: MIT License
    :target: `MIT License`_
.. |tests| image:: https://github.com/mdklatt/httpexec/actions/workflows/tests.yml/badge.svg
    :alt: CI Tests
    :target: `GitHub Actions`_

.. _MIT License: https://choosealicense.com/licenses/mit
.. _GitHub Actions: https://github.com/mdklatt/cmake-module/actions/workflows/tests.yml
.. _find module: https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html#find-modules
.. _CMAKE_MODULE_PATH: https://cmake.org/cmake/help/latest/variable/CMAKE_MODULE_PATH.html
.. _NetCDF: https://www.unidata.ucar.edu/software/netcdf

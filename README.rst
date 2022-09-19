############
cmake-module
############

|license|
|tests|

This project provides a collection of useful `CMake`_ modules.

Modules
=======

Build Types
-----------
The `build type`_ is set by `CMAKE_BUILD_TYPE`_ and determines the compiler
settings for the target binary, *e.g.* ``Debug`` or ``Release``.

DebugASanBuildType
++++++++++++++++++
Define the ``DebugASan`` build type for compiling with `AddressSanitizer`_.
If any memory issues are detected when the executable runs, it will exit with
a nonzero error status and a diagnostic report will be displayed. Enable this
in a *CMakeLists.txt* file using ``include(DebugASanBuildType)``.


Find Modules
------------
A `find module`_ is used with ``find_package()`` to find system libraries and
utilities. These use "modern CMake" and support exported targets and COMPONENTS
where appropriate.

FindNetCDF
++++++++++
Find the installed `NetCDF`_ libraries, with ``COMPONENTS`` for additional
languages (``CXX``, ``F77``, and ``F90``). The package exports the
``NetCDF::netcdf`` target.

FindUDUNITS2
++++++++++++
Find the installed UDUNITS2 library. The package exports the
``UDUNITS2::udunits2`` target.


Installation
============
Place module files in `CMAKE_MODULE_PATH`_.


Development
===========
Create a development environment and run tests:

.. code-block:: console

    $ make dev test


.. |license| image:: https://img.shields.io/github/license/mdklatt/httpexec
    :alt: MIT License
    :target: `MIT License`_
.. |tests| image:: https://github.com/mdklatt/httpexec/actions/workflows/tests.yml/badge.svg
    :alt: CI Tests
    :target: `GitHub Actions`_
.. _CMake: https://cmake.org
.. _MIT License: https://choosealicense.com/licenses/mit
.. _GitHub Actions: https://github.com/mdklatt/cmake-module/actions/workflows/tests.yml
.. _build type: https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#build-configurations
.. _CMAKE_BUILD_TYPE: https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_TYPE.html#variable:CMAKE_BUILD_TYPE
.. _CMAKE_MODULE_PATH: https://cmake.org/cmake/help/latest/variable/CMAKE_MODULE_PATH.html
.. _AddressSanitizer: https://github.com/google/sanitizers/wiki/AddressSanitizer
.. _find module: https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html#find-modules
.. _NetCDF: https://www.unidata.ucar.edu/software/netcdf
.. _UDUNITS2: https://www.unidata.ucar.edu/software/udunits

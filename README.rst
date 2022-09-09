============
cmake-module
============

|license|
|tests|

Build Types
===========

The `build configuration`_ type determines various settings that affect how
the target binary is compiled, *e.g* ``Debug`` versus ``Release``.  The
build type is determined by the value of `CMAKE_BUILD_TYPE`_. Install a build
type by placing its source file in `CMAKE_MODULE_PATH`_ and using
``include()`` to add it to a *CMakeLists.txt* file.

DebugASanBuildType
------------------
Define the ``DebugASan`` build type for compiling with `AddressSanitizer`_.
If any memory issues are detected when the executable runs, it will exit with
a nonzero error status and a diagnostic report will be displayed.


Find Modules
============

A `find module`_ is used with ``find_package()`` to find system libraries and
utilities. These use "modern CMake" and support exported targets and COMPONENTS
where appropriate. Install a find module by placing its source file somewhere
in `CMAKE_MODULE_PATH`_.

FindNetCDF
----------
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
.. _build configuration: https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html#build-configurations
.. _CMAKE_BUILD_TYPE: https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_TYPE.html#variable:CMAKE_BUILD_TYPE
.. _CMAKE_MODULE_PATH: https://cmake.org/cmake/help/latest/variable/CMAKE_MODULE_PATH.html
.. _AddressSanitizer: https://github.com/google/sanitizers/wiki/AddressSanitizer
.. _find module: https://cmake.org/cmake/help/latest/manual/cmake-developer.7.html#find-modules
.. _NetCDF: https://www.unidata.ucar.edu/software/netcdf

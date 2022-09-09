FROM ubuntu:20.04
RUN apt-get update &&\
    apt-get install --yes --no-install-recommends \
        gcc \
        g++ \
        gfortran \
        gdb \
        make \
        cmake \
        python3 \
        libnetcdf-dev \
        libnetcdf-c++4-dev \
        libnetcdff-dev &&\
    apt-get autoremove --yes &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /tmp/cmake-module

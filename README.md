# docker-rbin
A collection of simple binary complete Docker images for R. This repository contains the sources for a set of binary complete images for R 4.x based on different operating systems intended for Life Science GxP use and other regulated industries. 

The images are availabe on Docker Hub https://hub.docker.com/r/openapx/rbin.



### Getting Started

The images are available on Docker Hub in the openapx/rbin repository

The latest release for ubuntu
```
docker pull openapx/rbin:latest-ubuntu
```


The latest deelopment release for ubuntu 
```
docker pull openapx/rbin:dev-ubuntu
```


### Short Overview
Each image will support the last patch release for each minor version of R 4.x and later as long as they are supported by the same system libraries. The current development thread is based on Ubuntu 24.04 and R 4.3.x and later releases.

R versions are installed in the `/opt/R/<version>` directory.

R is built from sources downloaded from [r-project.org](https://r-project.org) (direct link to R 4.x sources https://cran.r-project.org/src/base/R-4/).

The standard build configuration is used.

```
./configure --prefix=/opt/R/<version> \
            --enable-R-shlib \
            --with-blas \
            --with-lapack \
            --with-recommended-packages=no
```
Recommended packages are not included as they may require additional validation.

Build logs are available in the `/logs/build/R` directory in compressed format.


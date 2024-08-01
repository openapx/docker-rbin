# docker-rbin
A binary complete container hosting multiple versions of R for the Life Science and other regulated industries.

The container will include the last three minor releases of R as long as they can be built with and on the same set of compilers, binary utilities, tools, etc. If a minor release has multiple patches, only the last patch is support with any preceding patches (that were included) will be deprecated over time.

*During the development phase of openapx rbin, only images based on Ubuntu 24.04 will be available.*


<br>

### Getting Started
The container images are available on Docker Hub (https://hub.docker.com/repository/docker/openapx/rbin) 

Get the latest release (corresponds to the *main* branch), for Ubuntu in this case, and connect using a standard shell.

```
$ docker pull openapx/rbin:latest-ubuntu
$ docker run -it openapx/rbin:latest-ubuntu
```

The latest development release (corresponds to the *development* branch) can be obtained by 
```
docker pull openapx/rbin:dev-ubuntu
```

<br>

### Basic configuration
All R versions are built from source automatically pulled from the R project (https://r-project.org) during the build process.

The binary dependencies as specified by the `libs` file at the root of the repository are installed prior to the first build of R.

The standard minimal build configuration is used. 

```
./configure --prefix=/opt/R/<version> \
            --enable-R-shlib \
            --with-blas \
            --with-lapack \
            --with-recommended-packages=no
```

Recommended packages are not included as they may require additional validation.

The R versions are installed in the directory `/opt/R/<version>` to permit multiple versions of R.

The R version site library directory is created by default for each R version `/opt/R/<version>/lib/R/site-library`.

Build logs and associated documentation are available in the `/logs/R/rbin/builds` directory in compressed format.

<br>

### Compliance
The `openapx/rbin` container will be documented and tested to support Life Science GxP-level validation and validation requirements for other regulated industries. 

The formal validation is the responsibility of each individual organization that uses the `openapx/rbin` container, our aim is provide some form of standard and save you a lot of effort.

The compliance documentation planned for `openapx/rbin` container is the equivalent to Installation Qualification (IQ) and will cover the following steps for each R version.

- Baseline Operating System
- Download from source
- Build configuration (`configure`)
- Build step (`make`) 
- Build verification (`make check all`)
- Install (`make install`)

<br>

### License
The `openapx/rbin` container uses the Apache license (see LICENSE file in the root of the repository). 

The `openapx/rbin` container is based on other software, tools, utilities, etc that in turn has their own individual licenses. As always, it is the responsibility of each individual organization and/or user that uses `openapz/rbin` to verify that their use is permitted under said licenses.

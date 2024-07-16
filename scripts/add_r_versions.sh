#! /bin/bash

# -- set up working directories
mkdir -p /sources/R /builds /logs/R/builds


# -- process R version
#
#

for BUILD_VER in $(grep "^[^#;]" $(dirname $0)/r_versions | tr '\n' ' '); do

  # -- download source	
  cd /sources/R
  wget --no-check-certificate --quiet https://cran.r-project.org/src/base/R-4/R-${BUILD_VER}.tar.gz

  # -- set up build area
  mkdir -p /builds/R-${BUILD_VER} /builds/sources

  # -- unpack tar
  cd /builds/sources
  tar -xf /sources/R/R-${BUILD_VER}.tar.gz

  # -- configure
  cd /builds/R-${BUILD_VER}

  ../sources/R-${BUILD_VER}/configure --prefix=/opt/R/${BUILD_VER} \
  	                              --enable-R-shlib \
				      --with-blas \
				      --with-lapack \
				      --with-recommended-packages=no > /logs/R/builds/R-${BUILD_VER}-config.log

  # -- build 
  make > /logs/R/builds/R-${BUILD_VER}-make.log

  # -- check build
  make check-all > /logs/R/builds/R-${BUILD_VER}-check.log

  # -- install build 
  make install > /logs/R/builds/R-${BUILD_VER}-install.log

  # -- initiate site library
  mkdir -p /opt/R/${BUILD_VER}/lib/R/site-library

done

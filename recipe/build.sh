#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

set -xe

export AR="${AR} cruv"
export INSTALL="install"
export MKINSTALLDIRS="mkdir -p"
export libdir="${PREFIX}/lib"
export includedir="${PREFIX}/include"
export FCFLAGS="${FFLAGS}"

autoreconf -i
./configure --prefix=${PREFIX}
make
if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  make tests
fi
make install

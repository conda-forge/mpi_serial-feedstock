#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

set -xe

export AR="${AR}"
export INSTALL="install"
export FCFLAGS="${FFLAGS}"

./configure --prefix=${PREFIX}
make
make install

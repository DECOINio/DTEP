#!/bin/bash

mkdir nsis
git archive HEAD | tar -x -C nsis
pushd nsis/src
mkdir ../release
cp ../../release/* ../release/
makensis ../share/setup.nsi
cp ../share/DECOIN-*-win32-setup.exe ../..
popd

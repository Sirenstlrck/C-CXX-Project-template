#!/usr/bin/sh

cd $(dirname $0)
outDir=$(cat ./OutDirName)
cd ..
cmake . -B ./${outDir} -DCMAKE_TOOLCHAIN_FILE=build/generators/conan_toolchain.cmake $@

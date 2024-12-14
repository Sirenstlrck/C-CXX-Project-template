#!/usr/bin/sh

cd $(dirname $0)
outDir=$(cat ./OutDirName)
cd ..
conan install . --output-folder=./${outDir} --build=missing --profile=debug

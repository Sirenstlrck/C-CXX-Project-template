#!/usr/bin/sh

cd $(dirname $0)

./clear.sh
./run-conan.sh
./generate-project-files.sh
./build.sh

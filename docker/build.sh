#!/bin/bash

# Available configs: Debug, [RelWithDebInfo], Release
[[ -z "$CONFIG" ]] \
&& config=RelWithDebInfo \
|| config="$CONFIG"
# Available versions: 18.04, [20.04], 22.04
[[ -z "$UBUNTU_VERSION" ]] \
&& ubuntu_version=18.04 \
|| ubuntu_version="$UBUNTU_VERSION"

docker build \
    -t open.mp-rivershell/build:ubuntu-${ubuntu_version} \
    build_ubuntu-${ubuntu_version}/ \
|| exit 1

folders=('build')
for folder in "${folders[@]}"; do
    if [[ ! -d "./${folder}" ]]; then
        mkdir ${folder} &&
        chown 1000:1000 ${folder} || exit 1
    fi
done

docker run \
    --rm \
    -t \
    -w /code \
    -v $PWD/..:/code \
    -v $PWD/build:/code/build \
    -e CONFIG=${config} \
    open.mp-rivershell/build:ubuntu-${ubuntu_version}

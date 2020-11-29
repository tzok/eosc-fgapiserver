#! /bin/bash
if [[ $1 == '--no-cache' ]]; then
    docker build --no-cache .
else
    docker build .
fi

if [[ $? -ne 0 ]]; then
    echo 'Failed to build the images'
    exit 1
fi

docker build \
    --target fgdb \
    -t eosc/fgdb \
    .

docker build \
    --target apiserverdaemon \
    -t eosc/apiserverdaemon \
    .

docker build \
    --target fgapiserver \
    -t eosc/fgapiserver \
    .

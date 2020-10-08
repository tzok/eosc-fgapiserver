#! /bin/bash
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

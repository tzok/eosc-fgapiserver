# eosc-fgapiserver

# Description

This is a project for containarized FutureGateway. It contains descriptions for building the images either via (1) ansible-container [deprecated], (2) buildah or (3) staged Dockerfile. It also contains documentation on how to run it via (1) Kubernetes, (2) Docker Compose and (3) plain Docker.

# Building

The building procedures create the following images:

- `eosc/fgdb`: an image based on `mariadb` bootstrapped with database from [FutureGatewayFramework/fgAPIServer](https://github.com/FutureGatewayFramework/fgAPIServer) project
- `eosc/fgapiserver`: an image based on `ubuntu:xenial` running Python server from [FutureGatewayFramework/fgAPIServer](https://github.com/FutureGatewayFramework/fgAPIServer) project
- `eosc/apiserverdaemon`: an image based on `ubuntu:xenial` running Apache Tomcat server from [FutureGatewayFramework/APIServerDaemon](https://github.com/FutureGatewayFramework/APIServerDaemon) project

# Running

The three different approaches to run the service are documented in their own directories.

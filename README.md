# eosc-fgapiserver

# Description

This is a project for [Buildah](http://buildah.io/). It contains scripts responsible for building Docker image. Specifically, it creates:

- an image based on `mariadb` bootstrapped with database from [FutureGatewayFramework/fgAPIServer](https://github.com/FutureGatewayFramework/fgAPIServer) project
- an image based on `ubuntu:xenial` running Python server from [FutureGatewayFramework/fgAPIServer](https://github.com/FutureGatewayFramework/fgAPIServer) project
- an image based on `ubuntu:xenial` running Apache Tomcat server from [FutureGatewayFramework/APIServerDaemon](https://github.com/FutureGatewayFramework/APIServerDaemon) project

# Requirements

- Buildah

# Preparation

- Build all images:

```
./01-fgdb
./02-apiserverdaemon
./03-fgapiserver
```

- Save them in Docker:

```
./10-export-to-docker
```

- Save them in Minikube:

```
./11-export-to-minikube
```

- Example Kubernetes specification is in `12-kubernetes` directory
- Alternatively, Docker Composer specification is in `13-docker-compose` directory

# eosc-fgapiserver

# Description

This is a project for [Ansible Container](https://www.ansible.com/integrations/containers/ansible-container). It contains description in [Ansible](https://www.ansible.com/) format on how to build Docker image. Specifically, it creates an image based on `ubuntu:xenial` and installs [FutureGatewayFramework/fgAPIServer](https://github.com/FutureGatewayFramework/fgAPIServer) on top of it (with all required dependencies).

# Requirements

- Docker
- Python

# Preparation

``` sh
$ git clone https://github.com/ansible/ansible-container.git
$ virtualenv venv
$ source venv/bin/activate
(venv) $ pip install -e ansible-container
```

# Usage

``` sh
$ git clone https://github.com/tzok/eosc-fgapiserver
$ source venv/bin/activate
(venv) $ cd eosc-fgapiserver
(venv) $ ansible-container build
```

By default, this will create:

- Docker image named `eosc-fgapiserver`
- With user `futuregateway`
- And `fgAPIServer` installed in `/home/futuregateway/fgAPIServer`
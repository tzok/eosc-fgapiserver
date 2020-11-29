# Create a Docker network

```
docker network create fgnet
docker network ls
```

# Run all containers

```
docker run --name fgdb --network fgnet --rm --detach eosc/fgdb
docker run --name apiserverdaemon --network fgnet --rm --detach eosc/apiserverdaemon
docker run --name fgapiserver --network fgnet --rm --detach --publish 8080:80 eosc/fgapiserver
```

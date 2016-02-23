This starts a single Zookeeper and a single Kafka Broker.

These instructions assume:
* Assumes Virtual Box is installed
* Docker Machine is installed
* Docker Compose 1.6 is installed.  We use version: '2' of the YAML file.  

In order to stand-up a Kafka Broker:
```
docker-machine create --driver virtualbox dev
eval $(docker-machine env dev)
DOCKER_MACHINE_IP=`docker-machine ip dev` docker-compose up
```

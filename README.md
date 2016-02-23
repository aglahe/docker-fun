# docker-fun
Place for simple standup of services needed for my development.  These instructions assume:
* Assumes Virtual Box is installed
* Docker Machine is installed
* Docker Compose 1.6 is installed.  We use version: '2' of the YAML file.  

## Kafka
This starts a single Zookeeper and a single Kafka Broker.  In order to stand-up a Kafka Broker:
```
docker-machine create --driver virtualbox dev
eval $(docker-machine env dev)
DOCKER_MACHINE_IP=`docker-machine ip dev` docker-compose -f kafka.yml
```

## HDFS
```
docker-machine create --driver virtualbox dev
eval $(docker-machine env dev)
DOCKER_MACHINE_IP=`docker-machine ip dev` docker-compose -f hdfs.yml
```

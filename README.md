# docker-fun
Place for simple standup of services needed for my development.  These instructions assume:
* Assumes Virtual Box is installed
* Docker Machine is installed
* Docker Compose 1.6 is installed.  We use version: '2' of the YAML file.  

## Everything
This starts a single Zookeeper, a single Kafka Broker, HDFS and YARN:
```
docker-machine create --driver virtualbox dev
eval $(docker-machine env dev)
DOCKER_MACHINE_IP=`docker-machine ip dev` docker-compose up
```

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

## YARN
This starts a single resource manager, a nodemanager
```
docker-machine create --driver virtualbox dev
eval $(docker-machine env dev)
DOCKER_MACHINE_IP=`docker-machine ip dev` docker-compose -f yarn.yml
```

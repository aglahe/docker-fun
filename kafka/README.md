This starts a single Zookeeper and a single Kafka Broker.

These instructions assume:
1.  Assumes Virtual Box is installed
2.  Docker Machine is installed
3.  Docker Compose 1.6 is installed.  We use version: '2' of the YAML file.  

0.  docker-machine create --driver virtualbox dev
1.  eval $(docker-machine env *machine-name*)
2.  DOCKER_MACHINE_IP=`docker-machine ip dev` docker-compose up

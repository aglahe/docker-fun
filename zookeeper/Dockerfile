FROM anapsix/alpine-java
MAINTAINER Aaron Glahe <aarongmldt@gmail.com>

# Setup the simple things
RUN apk add --update wget docker coreutils
USER root

# Setup env
ENV ZK_VERSION 3.4.8

# Download Apache Zookeeper, untar, setup zookeeper user, log/snapshot DIR
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZK_VERSION}/zookeeper-${ZK_VERSION}.tar.gz | tar -xzf - -C /opt \
 && ln -s /opt/zookeeper-${ZK_VERSION} /opt/zookeeper \
 && mkdir -p /var/lib/zookeeper

# Configure inital zookeeper settings
WORKDIR /opt/zookeeper
COPY start.sh bin/start.sh
COPY zoo.cfg.template conf/zoo.cfg

# Zookeeper client port, peer port, and leader (election) port
EXPOSE 2181 2888 3888

# Save the snapshot/log data outside of Zookepeer
VOLUME ["/var/lib/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/start.sh"]
CMD ["/opt/zookeeper/bin/zkServer.sh", "start-foreground"]

FROM anapsix/alpine-java
MAINTAINER Aaron Glahe <aarongmldt@gmail.com>

# Bring in the simple things
RUN apk add --update wget docker coreutils
USER root

# Setup env
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.10.0.0
ENV KAFKA_HOME /opt/kafka
ENV JMX_PORT 9999

# Install Kafka
RUN wget -q -O - http://apache.mirrors.hoobly.com/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz | tar -xzf - -C /opt && \
 ln -s /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" "$KAFKA_HOME"

#Ports
EXPOSE 9092 ${JMX_PORT}

# Location to store data
VOLUME ["/data/kafka"]

# Copy the bootstrap shell
COPY bootstrap.sh /bin/bootstrap.sh
ENTRYPOINT ["/bin/bootstrap.sh"]

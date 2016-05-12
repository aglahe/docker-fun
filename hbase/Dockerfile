FROM java:8
MAINTAINER Aaron Glahe <aarongmldt@gmail.com>

# Setup env
USER root
ENV INSTALL_LOCATION /opt
ENV HBASE_PREFIX /opt/hbase
ENV HBASE_HOME /opt/hbase
ENV HBASE_CONF_DIR /opt/hbase/conf
ENV HBASE_VERSION 1.2.1

# download hadoop & spark
RUN wget -q -O - http://www-eu.apache.org/dist/hbase/"$HBASE_VERSION"/hbase-"$HBASE_VERSION"-bin.tar.gz | tar -xzf - -C "$INSTALL_LOCATION" \
 && ln -s "$INSTALL_LOCATION"/hbase-"$HBASE_VERSION" "$HBASE_HOME"

# Copy the Site files up
#COPY hbase-site.xml.template "$HBASE_CONF_DIR"/hbase-site.xml.template
COPY hbase-site.xml.template "$HBASE_CONF_DIR"/hbase-site.xml

# HBase Ports
EXPOSE 8080 9090 9095 16000 16010 16020 16030

# Location to store data
VOLUME ["/data"]

# Copy the bootstrap shell
COPY bootstrap.sh /bin/bootstrap.sh

# Entry Point for our
WORKDIR /opt/hbase
ENTRYPOINT ["/bin/bootstrap.sh"]
CMD ["hbase"]

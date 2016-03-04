FROM java:8
MAINTAINER Aaron Glahe <aarongmldt@gmail.com>

# Setup env
USER root
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV INSTALL_LOCATION /opt
ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_COMMON_HOME /opt/hadoop
ENV HADOOP_HDFS_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop

# download hadoop & spark
RUN wget -q -O - http://apache.mirrors.pair.com/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz | tar -xzf - -C "$INSTALL_LOCATION" \
 && ln -s "$INSTALL_LOCATION"/hadoop-2.7.2 "$INSTALL_LOCATION"/hadoop \
 && wget -q -O - http://d3kbcqa49mib13.cloudfront.net/spark-1.6.0-bin-hadoop2.6.tgz | tar -xzf - -C "$INSTALL_LOCATION" \
 &&  ln -s "$INSTALL_LOCATION"/spark-1.6.0-bin-hadoop2.6 "$INSTALL_LOCATION"/spark

# Copy the Site files up
COPY core-site.xml.template "$HADOOP_CONF_DIR"/core-site.xml
COPY hdfs-site.xml.template "$HADOOP_CONF_DIR"/hdfs-site.xml
COPY yarn-site.xml.template "$HADOOP_CONF_DIR"/yarn-site.xml
COPY mapred-site.xml.template "$HADOOP_CONF_DIR"/mapred-site.xml

# Resource Mgr and NodeManager
EXPOSE 8020 50070 50010 50020 50075

# YARN
EXPOSE 8032 8030 8031 8033 8088 8040 8042 8041

# Copy the bootstrap shell
COPY bootstrap.sh /bin/bootstrap.sh

# Entry Point for our
ENTRYPOINT ["/bin/bootstrap.sh"]
CMD ["bash"]

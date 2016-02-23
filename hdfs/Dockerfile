FROM java:8
MAINTAINER Aaron Glahe <aarongmldt@gmail.com>

# Setup env
USER root
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV HADOOP_USER hdfs

ENV INSTALL_LOCATION /opt
ENV HADOOP_PREFIX /opt/hadoop
ENV HADOOP_COMMON_HOME /opt/hadoop
ENV HADOOP_HDFS_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop

# download hadoop
RUN wget -q -O - http://apache.mirrors.pair.com/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz | tar -xzf - -C "$INSTALL_LOCATION" \
 && ln -s "$INSTALL_LOCATION"/hadoop-2.7.2 "$INSTALL_LOCATION"/hadoop \
 && groupadd -r hadoop \
 && groupadd -r $HADOOP_USER && useradd -r -g $HADOOP_USER -G hadoop $HADOOP_USER

# Copy the Site files up
WORKDIR "$INSTALL_LOCATION"/hadoop
COPY core-site.xml.template etc/hadoop/core-site.xml
COPY hdfs-site.xml.template etc/hadoop/hdfs-site.xml

#Ports: Namenode                         DataNode
EXPOSE 8020 8022 9000 50070 50470 50090 50495 1006 1004 50010 50020 50075 50475

# Location to store data
VOLUME ["/data/hdfs/dn", "/data/hdfs/journal", "/data/hdfs/nn"]

# Copy the bootstrap shell
COPY bootstrap.sh /bin/bootstrap.sh

# Entry Point for our
USER $HADOOP_USER
ENTRYPOINT ["/bin/bootstrap.sh"]
CMD ["bash"]

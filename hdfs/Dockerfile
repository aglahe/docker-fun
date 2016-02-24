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

# download hadoop
RUN wget -q -O - http://apache.mirrors.pair.com/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz | tar -xzf - -C "$INSTALL_LOCATION" \
 && ln -s "$INSTALL_LOCATION"/hadoop-2.7.2 "$INSTALL_LOCATION"/hadoop

# Setup passwordless SSH
#RUN ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa \
# && cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys \
# && chmod 0600 ~/.ssh/authorized_keys

# Copy the Site files up
COPY core-site.xml.template "$HADOOP_CONF_DIR"/core-site.xml
COPY hdfs-site.xml.template "$HADOOP_CONF_DIR"/hdfs-site.xml

# NameNode (HDFS) DataNode (HDFS)
EXPOSE 8020 50070 50010 50020 50075

# Copy the bootstrap shell
COPY bootstrap.sh /bin/bootstrap.sh

# Entry Point for our
ENTRYPOINT ["/bin/bootstrap.sh"]
CMD ["bash"]

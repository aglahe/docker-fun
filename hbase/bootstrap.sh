#!/bin/bash

# Replace all the variables in core-site.xml
#sed "s/ZK_IPS/$ZK_IPS/" /opt/hbase/conf/hbase-site.xml.template > /opt/hbase/conf/hbase-site.xml

case "$1" in
  hbase)
    $HBASE_PREFIX/bin/hbase-daemon.sh start zookeeper
    $HBASE_PREFIX/bin/hbase-daemon.sh start master
    $HBASE_PREFIX/bin/hbase regionserver start
    ;;
  *)
    echo $"Usage: {hbase}"
    eval $*
esac

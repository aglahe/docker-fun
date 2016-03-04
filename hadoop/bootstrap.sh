#!/bin/bash

case "$1" in
  dfs)
    if [[ ! -a /tmp/hadoop-root/dfs/name/VERSION ]]; then
      echo "Format Namenode.."
      $HADOOP_PREFIX/bin/hdfs namenode -format
    fi
    $HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
    $HADOOP_PREFIX/bin/hdfs datanode
    ;;
  yarn)
    $HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager
    $HADOOP_PREFIX/bin/yarn nodemanager
    ;;
  *)
    echo $"Usage: {yarn|dfs}"
    eval $*
esac

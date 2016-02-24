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
  *)
    echo $"Usage: {dfs}"
    eval $*
esac

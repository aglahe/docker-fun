#!/bin/bash
case "$1" in
  dfs)
    $HADOOP_PREFIX/bin/hdfs namenode -format
    $HADOOP_PREFIX/sbin/start-dfs.sh
    ;;
  bash)
    /bin/bash
    ;;
  *)
    echo $"Usage: {dfs|bash}"
    eval $*
esac

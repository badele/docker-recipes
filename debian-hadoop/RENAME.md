# A hadoop cluster with 3 datanodes and 1 namenode

A hadoop cluster for learn the hadoop configuration.

## How to use

### Init HDFS

Run this only one time

    docker-compose run namenode hdfs namenode -format

### Start hadoop cluster

Launching the namenode and 3 datanodes with below command

    docker-compose up

### Put data in the HDFS

   hadoop fs -put local_filename hdfs://localhost/
# A hadoop cluster with 3 datanodes and 1 namenode

A hadoop cluster for learn the hadoop configuration.

## How to use

### Init HDFS

Run this only one time

    docker-compose run namenode hdfs namenode -format

### Start hadoop cluster

Launching the namenode and 3 datanodes with below command

    docker-compose up -d

### Put data in the HDFS

    hadoop fs -put local_filename hdfs://localhost/

### docker-compose.yml

    namenode:
      image: badele/debian-hadoop
      hostname: namenode
      volumes:
        - /docker_shared/debian-hadoop/namenode:/shared
      ports:
        - "8020:8020"
        - "50070:50070"
      command: hdfs namenode


    datanode1:
      image: badele/debian-hadoop
      hostname: datanode1
      volumes:
          - /docker_shared/debian-hadoop/datanode1:/shared
      links:
          - namenode
      ports:
          - "5001:50075"
      command: hdfs datanode

    datanode2:
      image: badele/debian-hadoop
      hostname: datanode2
      volumes:
          - /docker_shared/debian-hadoop/datanode2:/shared
      links:
          - namenode
      ports:
          - "5002:50075"
      command: hdfs datanode

    datanode3:
      image: badele/debian-hadoop
      hostname: datanode3
      volumes:
          - /docker_shared/debian-hadoop/datanode3:/shared
      links:
          - namenode
      ports:
          - "5003:50075"
      command: hdfs datanode

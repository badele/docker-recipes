# A cassandra cluster docker container

This container is a sample of the cassandra cluster docker container. This container contain :

* seed1
* node1
* seed2
* node2
* manager (opscenter tools)
 

## How to launch the cassandra cluster

    docker-compose up -d
        
# Manage cluster

## Manage with opscenter

With your navigator goto to http://localhost:8888/

## Manage with nodetools

    docker exec -ti debiancassandra_seed1_1 bash
    # in the seed1 docker container
    nodetool status
    
    
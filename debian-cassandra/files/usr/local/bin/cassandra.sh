#!/bin/bash

# Replace the cassandra.yaml configuration file
cat /etc/cassandra/cassandra.yaml | sed -i bak -e s/{HOSTNAME}/$HOSTNAME/g /etc/cassandra/cassandra.yaml

# set variable for cqlsh
export CQLSH_HOST=$HOSTNAME

# Start services
service datastax-agent start
cassandra -f
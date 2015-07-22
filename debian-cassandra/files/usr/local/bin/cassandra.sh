#!/bin/bash

# Replace the cassandra.yaml configuration file
cat /etc/cassandra/cassandra.yaml | sed -i bak -e s/{HOSTNAME}/$HOSTNAME/g /etc/cassandra/cassandra.yaml

# Start services
service datastax-agent start
cassandra -f
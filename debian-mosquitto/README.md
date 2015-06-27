# A mosquitto mqtt broker


A mosquitto server + publisher + subscriber configuration.

## How to use

### Start & Configure

Start the dockers containers

    # Start the dockers
    $ docker-compose up -d

    # Open the two terminals
    $ docker exec -ti debianmqtt_mqttpub_1 bash
    $ docker exec -ti debianmqtt_mqttsub_1 bash

    # On subscriber terminal
    $ mosquitto_sub -h mqttserver -t "#"

    # On published terminal
    $ mosquitto_pub -h mqttserver -t "/home/root" -m "hello world"

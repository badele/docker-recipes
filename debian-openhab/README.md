# openHAB demo

A fully functional openHAB demo docker container

## How to use

### Start & Configure

Start the dockers containers

    # First time
    XSOCK=/tmp/.X11-unix/X0
    $ docker run -ti --name openhab -v $XSOCK:$XSOCK -p 8080:8080 -p 8443:8443 badele/debian-openhab

    # Next time
    $ docker start -a openhab
    # Go to user interface http://localhost:8080/
    # Go to admin interface http://localhost:8080/habmin/
    # You can also use the openHAB designer
    $ docker exec -ti openhab bash
    $ cd /opt/openhab-designer/
    $ ./openHAB-Designer

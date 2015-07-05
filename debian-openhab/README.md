# openHAB demo

A fully functional openHAB demo docker container

## How to use

### Start & Configure

Start the dockers containers

    # Start the dockers
    $ docker run -ti --name openhab -p 8080:8080 -p 8443:8443 badele/debian-openhab
    # Go to user interface http://localhost:8080/
    # Go to admin interface http://localhost:8080/habmin/
    $ docker start -a openhab (restart container later)
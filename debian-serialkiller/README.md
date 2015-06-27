# A mosquitto mqtt broker


A serialkiller docker container

## How to use

### Start & Configure

Start the dockers containers

    # Start the dockers
    $ docker run -ti --rm --name serialkiller -p 3000:3000 badele/debian-serialkiller
    
    # On another terminal
    $ docker exec -ti serialkiller bash
    $ python3 /usr/local/bin/weather_montpellier.py

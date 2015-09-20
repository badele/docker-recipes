# A debian python3 stack

## How to use

### Start & Configure

Start the dockers containers

    # First time
    $ docker run -ti --name hass -p 8123:8123 badele/debian-home-assistant

    # Next time
    $ docker start -a hass
    # Go to user interface http://localhost:8123
    
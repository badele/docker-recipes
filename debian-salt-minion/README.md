# A salt master and minion sample server

A salt configuration for learn the salt master + minion configuration.

## How to use

### Start & Configure

Start the salt configuration (master + minion)

    $ docker-compose up -d
    $ docker exec -ti debiansaltmaster_salt_1  bash
    # new bash session in master
    $ salt-key -L # See the minion server contact the master
    $ salt-key -A # Accept the key
    $ salt-key -L # See the accepted keys


First salt command

You can test the all minion client is connected to the master

    $ salt '*' test.ping # See the minion is connected
FROM badele/debian-mosquitto
MAINTAINER Bruno Adelé "bruno@adele.im"

# Supervisor
RUN apt-get install -y supervisor

# Mosquitto
RUN apt-get install -y mosquitto mosquitto-clients

# Python stack
RUN apt-get install -y python3 python3-mosquitto

#NodeJS
RUN apt-get install -y curl
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

#SQLite3
RUN apt-get install -y sqlite3


# Add files
ADD files/serialkiller/mqtt/pub/weather_montpellier.py /usr/local/bin/
ADD files/serialkiller/mqtt/pub/currenttime.py /usr/local/bin/
ADD files/nodejs/server.js /var/www/
ADD files/supervisord/ /etc/supervisor/conf.d/

CMD /usr/bin/supervisord -n
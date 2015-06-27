FROM badele/debian-mosquitto
MAINTAINER Bruno Adelé "bruno@adele.im"

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y python


# Mosquitto
RUN apt-get install -y mosquitto mosquitto-clients

# Python stack
RUN apt-get install -y python3 python3-mosquitto
ADD weather_montpellier.py /usr/local/bin/weather_montpellier.py

#NodeJS
RUN apt-get install -y curl
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

ADD server.js /var/www/server.js

EXPOSE 3000

CMD node /var/www/server.js
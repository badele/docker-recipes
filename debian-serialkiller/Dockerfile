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

# Add files
ADD files/serialkiller/weather_montpellier.py /usr/local/bin/weather_montpellier.py
ADD files/nodejs/server.js /var/www/
ADD files/supervisord/ /etc/supervisor/conf.d/

CMD /usr/bin/supervisord -n
FROM badele/debian-mosquitto
MAINTAINER Bruno Adelé "bruno@adele.im"

# Supervisor
RUN apt-get install -y supervisor

#NodeJS
RUN apt-get install -y curl
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

#SQLite3
RUN apt-get install -y sqlite3

# Add serialkiller-plugins
RUN cd /usr/local/src && git clone https://github.com/badele/serialkiller-plugins.git
RUN cd /usr/local/src/serialkiller-plugins && python3 setup.py install

# Add files
ADD files/serialkiller/mqtt/pub/weather_montpellier.py /usr/local/bin/
ADD files/serialkiller/mqtt/pub/currenttime.py /usr/local/bin/
ADD files/nodejs/server.js /var/www/
ADD files/supervisord/ /etc/supervisor/conf.d/

CMD /usr/bin/supervisord -n
FROM badele/debian-mosquitto
MAINTAINER Bruno Adelé "bruno@adele.im"

RUN apt-get install -y curl mosquitto mosquitto-clients python3 python3-mosquitto
ADD weather_montpellier.py /usr/local/bin/weather_montpellier.py
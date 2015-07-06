FROM badele/debian-mybase
MAINTAINER Bruno Adelé "bruno@adele.im"


RUN apt-get update
RUN apt-get -yf upgrade
RUN apt-get -yf dist-upgrade

# Install ipsec packages
RUN apt-get install -y racoon ipsec-tools
RUN mkdir /var/run/racoon/

ADD files/ /etc/local/src/ipsec
ADD files/start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/start.sh

# Clean the cache and unused packages
RUN apt-get clean
RUN apt-get autoremove

EXPOSE 500/udp 4500/udp

CMD start.sh sitea

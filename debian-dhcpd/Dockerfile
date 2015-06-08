FROM badele/debian-mybase
MAINTAINER Bruno Adelé "bruno@adele.im"

# Install dhcp server
RUN apt-get update
RUN apt-get install -y isc-dhcp-server

# Install configuration
#ADD dhcpd.conf /etc/dhcp/
ADD https://raw.githubusercontent.com/jpetazzo/pipework/master/pipework /usr/bin/pipework

# Wait the pipework interface
#CMD pipework --wait -i eth1 && dhcpd -f eth1

FROM badele/debian-openjdk:7
MAINTAINER Bruno Adelé "bruno@adele.im"

USER root
ENV DEBIAN_FRONTEND noninteractive

# Source : http://docs.datastax.com/en/cassandra/2.0/cassandra/install/installDeb_t.html
# Don't forger swapoff --all in the pysical installation

# Install requirements packages
RUN apt-get update
RUN apt-get install -y sudo nano curl libjna-java ntp python2.7

# Install Cassandra
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
RUN apt-get update
RUN apt-get install -y dsc20=2.0.11-1 cassandra=2.0.11 datastax-agent=5.2.0

# Init cassandra for debian
RUN service cassandra stop
RUN rm -rf /var/lib/cassandra/data/system/*

# Copy files
ADD files/etc/cassandra/* /etc/cassandra/
ADD files/usr/local/bin/ /usr/local/bin
RUN chmod 755 /usr/local/bin/cassandra.sh

# set bash variable for cqlsh client
RUN echo "export CQLSH_HOST=\$HOSTNAME" >> /root/.bashrc

EXPOSE 7000 7199 9160

CMD cassandra.sh


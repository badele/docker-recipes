FROM badele/debian-openjdk:7
MAINTAINER Bruno Adelé "bruno@adele.im"

USER root
ENV DEBIAN_FRONTEND noninteractive

# Source : http://docs.datastax.com/en/cassandra/2.0/cassandra/install/installDeb_t.html
# Don't forger swapoff --all in the pysical installation

# Install requirements packages
RUN apt-get update
RUN apt-get install -y nano curl libjna-java ntp python2.7

# Install opscenter
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
RUN apt-get update
RUN apt-get install -y opscenter

# opscenter configuration
ADD files/etc/opscenter/clusters/ /etc/opscenter/clusters/
ADD files/usr/local/bin/ /usr/local/bin
RUN chmod 755 /usr/local/bin/opscenter.sh

EXPOSE 8888 61620

CMD opscenter.sh


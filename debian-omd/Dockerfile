FROM debian:wheezy
MAINTAINER Bruno Adelé "bruno@adele.im"

# Source from http://labs.consol.de/OMD

# Install GPG key
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys F8C1CA08A57B9ED7
RUN gpg --armor --export F8C1CA08A57B9ED7 | apt-key add -

# Add OMD source
RUN echo 'deb http://labs.consol.de/repo/stable/debian wheezy main' >> /etc/apt/sources.list
RUN apt-get update

# Install
RUN apt-get -y install omd


FROM debian:jessie
MAINTAINER Bruno Adelé "bruno@adele.im"

USER root
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV DISPLAY :0

# Upgrade the distribution
RUN apt-get update
RUN apt-get -y upgrade

CMD bash

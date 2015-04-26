# Inspired by
# - http://www.christopherbiscardi.com/2014/10/17/emacs-in-docker/
# - http://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container

FROM debian:jessie
MAINTAINER Bruno Adelé "bruno@adele.im"

USER root
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV DISPLAY :0

# Install emacs and requirements for el-get
RUN apt-get update
RUN apt-get install -y make texinfo install-info python git mercurial
RUN apt-get install -y emacs24

ADD .emacs.el /root/.emacs.el 

CMD emacs

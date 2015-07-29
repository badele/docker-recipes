FROM badele/debian-openjdk:7
MAINTAINER Bruno Adelé "bruno@adele.im"

USER root
ENV DEBIAN_FRONTEND noninteractive


# Install dev tools
RUN apt-get update
RUN apt-get install -y curl unzip

# Create directory
RUN mkdir /opt/openhab-designer

# Install runtime
WORKDIR /opt/openhab-designer
RUN curl -LO https://bintray.com/artifact/download/openhab/bin/distribution-1.7.0-designer-linux64bit.zip
RUN unzip distribution-1.7.0-designer-linux64bit.zip
RUN rm distribution-1.7.0-designer-linux64bit.zip

CMD ./openHAB-Designer
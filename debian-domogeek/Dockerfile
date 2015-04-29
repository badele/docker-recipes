FROM debian:7.6

MAINTAINER Bruno Adelé <bruno@adele.im>

# Update the debian
RUN apt-get update -qq
RUN apt-get install -y git python python-pip python-dev

# Get source
RUN mkdir /opt/domogeek-dev 
RUN cd /opt/domogeek-dev && git clone -b python_setup https://github.com/badele/api-domogeek.git

# Install python requirements
RUN cd /opt/domogeek-dev/api-domogeek && python setup.py develop

# Run domogeek
ENTRYPOINT cd /opt/domogeek-dev/api-domogeek/api-domogeek && python apidomogeek.py console

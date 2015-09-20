FROM badele/debian-mybase

MAINTAINER Bruno Adelé "bruno@adele.im"

# Python3 stack
RUN apt-get update && apt-get install -y python3 python3-pip python3-setuptools

# Clean the cache and unused packages
RUN apt-get clean
RUN apt-get autoremove
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
FROM badele/debian-mybase
MAINTAINER Bruno Adelé "bruno@adele.im"

# Upgrade the distribution
RUN apt-get update
RUN apt-get -yf upgrade
RUN apt-get -yf dist-upgrade

# Requirement package
RUN apt-get -y install curl

# Install nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs build-essential

# Clean the cache and unused packages
RUN apt-get clean
RUN apt-get autoremove

CMD bash

FROM badele/debian-python3

MAINTAINER Bruno Adelé "bruno@adele.im"

# For the nmap tracker
RUN apt-get update && apt-get install -y git

# Install home-assitant from git repository
RUN cd /opt && git clone https://github.com/balloob/home-assistant.git

# Install home assistant in developement mode
RUN cd /opt/home-assistant && script/setup

# Clean the cache and unused packages
RUN apt-get clean
RUN apt-get autoremove
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add sample configuration
ADD files/configuration.yaml /opt/home-assistant/config/configuration.yaml

CMD hass --config /opt/home-assistant/config/
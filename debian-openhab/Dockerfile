FROM badele/debian-openjdk:7
MAINTAINER Bruno Adelé "bruno@adele.im"

USER root
ENV DEBIAN_FRONTEND noninteractive


# Install dev tools
RUN apt-get update
RUN apt-get install -y curl unzip

# Create directory
RUN mkdir /opt/openhab

# Install runtime
WORKDIR /opt/openhab
RUN curl -LO https://bintray.com/artifact/download/openhab/bin/distribution-1.7.0-runtime.zip
RUN unzip distribution-1.7.0-runtime.zip
RUN rm distribution-1.7.0-runtime.zip


#RUN curl -LO https://bintray.com/artifact/download/openhab/bin/distribution-1.7.0-demo-configuration.zip
#RUN unzip -o distribution-1.7.0-demo-configuration.zip
#RUN rm distribution-1.7.0-demo-configuration.zip

# Install designer
RUN curl -LO https://github.com/cdjackson/HABmin/releases/download/0.1.3-snapshot/habmin.zip
RUN unzip habmin.zip

# Configure openHAB
ADD files/configurations/ configurations/
#RUN mv configurations/sitemaps/demo.sitemap configurations/sitemaps/default.sitemap
RUN chmod +x start.sh


# Install temporary addons
WORKDIR /opt/openhab/addons_src
RUN curl -LO https://bintray.com/artifact/download/openhab/bin/distribution-1.7.0-addons.zip
RUN unzip distribution-1.7.0-addons.zip
RUN rm distribution-1.7.0-addons.zip

# Move addons
RUN mv org.openhab.binding.http* ../addons/
RUN mv org.openhab.binding.ntp* ../addons/
RUN mv org.openhab.binding.exec* ../addons/
RUN mv org.openhab.*mqtt* ../addons/
RUN mv org.openhab.persistence.* ../addons/

# Install demo
WORKDIR /opt/openhab
ADD files/items/ configurations/items/
ADD files/persistence/ configurations/persistence/
ADD files/rules/ configurations/rules/
ADD files/scripts/ configurations/scripts/
ADD files/sitemaps/ configurations/sitemaps/
ADD files/transform/ configurations/transform/
ADD files/configurations/ configurations/

VOLUME [ /opt/openhab ]
EXPOSE 8080 8443 5555 9001

# Launch the server
WORKDIR /opt/openhab/
CMD ./start.sh
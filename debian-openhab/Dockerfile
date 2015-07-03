FROM badele/debian-openjdk:7
MAINTAINER Bruno Adelé "bruno@adele.im"

USER root
ENV DEBIAN_FRONTEND noninteractive


# Install dev tools
RUN apt-get update
RUN apt-get install -y wget unzip

# Create directory
RUN mkdir /opt/openhab

# Install runtime
WORKDIR /opt/openhab
RUN wget https://bintray.com/artifact/download/openhab/bin/distribution-1.7.0-runtime.zip
RUN unzip distribution-1.7.0-runtime.zip
RUN rm distribution-1.7.0-runtime.zip

# Install addons
WORKDIR /opt/openhab/addons
RUN wget https://bintray.com/artifact/download/openhab/bin/distribution-1.7.0-addons.zip
RUN unzip distribution-1.7.0-addons.zip
RUN rm distribution-1.7.0-addons.zip

# Install demo
WORKDIR /opt/openhab
#RUN wget https://bintray.com/artifact/download/openhab/bin/distribution-1.7.0-demo-configuration.zip
RUN wget https://d29vzk4ow07wi7.cloudfront.net/2b2cd96788958a5d5642b2e71e9ea9e8e310fda6?response-content-disposition=attachment;filename=%22distribution-1.7.0-runtime.zip%22&Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6Imh0dHAqOi8vZDI5dnprNG93MDd3aTcuY2xvdWRmcm9udC5uZXQvMmIyY2Q5Njc4ODk1OGE1ZDU2NDJiMmU3MWU5ZWE5ZThlMzEwZmRhNj9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPWF0dGFjaG1lbnQlM0JmaWxlbmFtZSUzRCUyMmRpc3RyaWJ1dGlvbi0xLjcuMC1ydW50aW1lLnppcCUyMiIsIkNvbmRpdGlvbiI6eyJEYXRlTGVzc1RoYW4iOnsiQVdTOkVwb2NoVGltZSI6MTQzNTkwNDE3NH0sIklwQWRkcmVzcyI6eyJBV1M6U291cmNlSXAiOiIwLjAuMC4wLzAifX19XX0_&Signature=TfmBlRrNbLzCCrUSeT~foPP0t9XXyjzf6DRaSt85kntd-kI1WOTri-FQNc2QY3-chEj~zXUErUiVI0T1MXBrwELxP1h~WGVB3t7cSG8V-d3NjPAEi5DP0-OuSCEKcvpIXGb7j9r1IcoLc~9APpaF9UAlkLhlPbFUfoYAxF98L9uUFEEq4cMRGPC2wCkpbD1PB~pgPR8pDo5IkrCsOEE98sfSHhx6D2QxrXVdHm-zzRnzpey6PqwrFGgj1KyY4tMgJwYNyynb5T93APdKY1bkT~rbHmEklk2HjeGYoqqwcW721hpya9nWU2FJNOzLvy0Utrv2n5vtNgv6Bu-TVeQLdQ__&Key-Pair-Id=APKAIFKFWOMXM2UMTSFA
RUN unzip -o distribution-1.7.0-demo-configuration.zip
RUN rm distribution-1.7.0-demo-configuration.zip

# Install designer
RUN wget https://github.com/cdjackson/HABmin/releases/download/0.1.3-snapshot/habmin.zip
RUN unzip habmin.zip

# Configure openHAB
RUN cp configurations/openhab_default.cfg configurations/openhab.cfg
RUN mv configurations/sitemaps/demo.sitemap configurations/sitemaps/default.sitemap
RUN chmod +x start.sh


EXPOSE 8080 8443 5555 9001

CMD ./start.sh

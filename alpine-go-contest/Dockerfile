FROM badele/alpine-go-minimal
MAINTAINER Bruno Adelé "bruno@adele.im"

RUN apk add --no-cache sqlite ca-certificates

RUN mkdir -p /opt/go-contest
COPY go-contest /opt/go-contest/go-contest
RUN chmod +x /opt/go-contest/go-contest

COPY create_database.sql /opt/go-contest/

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
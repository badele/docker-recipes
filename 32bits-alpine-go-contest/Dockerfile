FROM badele/32bits-alpine-go-minimal
MAINTAINER Bruno Adelé "bruno@adele.im"

RUN apk add --no-cache sqlite ca-certificates

RUN mkdir -p /opt/go-contest
COPY go-contest /opt/go-contest/go-contest
RUN chmod +x /opt/go-contest/go-contest
RUN ln -s /opt/go-contest/go-contest /usr/local/bin/go-contest

COPY create_database.sql /opt/go-contest/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["go-contest"]
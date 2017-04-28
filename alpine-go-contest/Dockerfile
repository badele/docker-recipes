FROM badele/alpine-go-minimal
MAINTAINER Bruno Adelé "bruno@adele.im"

RUN apk add --no-cache sqlite ca-certificates

RUN mkdir -p /opt/go-contest
COPY go-contest /opt/go-contest/go-contest
RUN chmod +x /opt/go-contest/go-contest
RUN ln -s /opt/go-contest/go-contest /usr/local/bin/go-contest

COPY create_database.sql /opt/go-contest/

COPY create_database.sh /opt/go-contest/create_database.sh
RUN ln -s /opt/go-contest/create_database.sh /usr/local/bin/create_database.sh
RUN chmod +x /opt/go-contest/create_database.sh

ENTRYPOINT ["create_database.sh"]
CMD ["go-contest"]
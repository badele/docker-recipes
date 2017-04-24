FROM alpine
MAINTAINER Bruno Adelé "bruno@adele.im"

COPY go-contest /usr/local/bin/
COPY config.sh /etc/go-contest.config.sh

RUN chmod +x /usr/local/bin/go-contest
RUN chmod +x /etc/go-contest.config.sh
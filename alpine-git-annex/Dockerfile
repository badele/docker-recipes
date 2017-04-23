FROM alpine
MAINTAINER Bruno Adelé "bruno@adele.im"


ENV PATH="${PATH}:/tmp/git-annex.linux"

RUN apk add --no-cache git curl

RUN curl -Lo /tmp/git-annex-standalone-amd64.tar.gz https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz
RUN cd /tmp && tar -xzf git-annex-standalone-amd64.tar.gz && rm git-annex-standalone-amd64.tar.gz

RUN apk del --no-cache curl


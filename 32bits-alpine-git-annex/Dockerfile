FROM multiarch/alpine:x86-v3.3
MAINTAINER Bruno Adelé "bruno@adele.im"


ENV PATH="${PATH}:/tmp/git-annex.linux"

RUN apk add --no-cache git curl

RUN curl -Lo /tmp/git-annex-standalone-i386.tar.gz https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-i386.tar.gz
RUN cd /tmp && tar -xzf git-annex-standalone-i386.tar.gz && rm git-annex-standalone-i386.tar.gz

RUN apk del --no-cache curl


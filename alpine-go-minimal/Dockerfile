FROM alpine
MAINTAINER Bruno Adelé "bruno@adele.im"

# Emulate glibc for running the Go executable
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
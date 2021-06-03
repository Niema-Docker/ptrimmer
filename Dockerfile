# Minimal Docker image for pTrimmer v1.3.4 using Alpine base
FROM alpine:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install pTrimmer
RUN apk update && \
    apk add bash gcc linux-headers make musl-dev zlib-dev && \
    wget -qO- "https://github.com/DMU-lilab/pTrimmer/archive/refs/tags/V1.3.4.tar.gz" | tar -zx && \
    cd pTrimmer-* && \
    make && \
    mv pTrimmer-* /usr/local/bin/pTrimmer && \
    cd .. && \
    rm -rf pTrimmer-*

# Minimal Docker image for pTrimmer using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install pTrimmer
RUN apk update && \
    apk add bash gcc linux-headers make musl-dev py3-pip python3 zlib-dev && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip install --no-cache-dir pyfaidx && \
    wget -qO- "https://github.com/DMU-lilab/pTrimmer/archive/refs/tags/V1.4.1.tar.gz" | tar -zx && \
    cd pTrimmer-* && \
    make && \
    mv pTrimmer-* /usr/local/bin/pTrimmer && \
    chmod a+x Test/*.py && \
    mv Test/*.py /usr/local/bin/ && \
    cd .. && \
    rm -rf pTrimmer-*

# Minimal Docker image for pTrimmer v1.3.4 using Alpine base
FROM alpine:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install pTrimmer
RUN apk update && \
    apk add bash gcc linux-headers make musl-dev python3 zlib-dev && \
    ln -s $(which python3) /usr/local/bin/python && \
    wget -qO- "https://github.com/DMU-lilab/pTrimmer/archive/refs/tags/V1.3.4.tar.gz" | tar -zx && \
    cd pTrimmer-* && \
    make && \
    mv pTrimmer-* /usr/local/bin/pTrimmer && \
    cd .. && \
    # Bed2Amplicon.py isn't in the release tarball yet, but in a future pTrimmer release, it should be, so use version from there in the future
    wget -O /usr/local/bin/Bed2Amplicon.py "https://raw.githubusercontent.com/DMU-lilab/pTrimmer/master/Test/Bed2Amplicon.py" && \
    chmod a+x /usr/local/bin/Bed2Amplicon.py && \
    rm -rf pTrimmer-*

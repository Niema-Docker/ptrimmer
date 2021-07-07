# Minimal Docker image for pTrimmer v1.3.4 using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install pTrimmer
RUN apk update && \
    apk add bash gcc linux-headers make musl-dev py3-pip python3 zlib-dev && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip install --no-cache-dir 'pyfaidx==0.5.9.5' && \
    wget -qO- "https://github.com/DMU-lilab/pTrimmer/archive/refs/tags/V1.3.4.tar.gz" | tar -zx && \
    cd pTrimmer-* && \
    make && \
    mv pTrimmer-* /usr/local/bin/pTrimmer && \
    cd .. && \
    # Bed2Amplicon.py isn't in the release tarball yet, but in a future pTrimmer release, it should be, so use version from there in the future
    wget -O /usr/local/bin/Bed2Amplicon.py "https://raw.githubusercontent.com/DMU-lilab/pTrimmer/master/Test/Bed2Amplicon.py" && \
    chmod a+x /usr/local/bin/Bed2Amplicon.py && \
    rm -rf pTrimmer-*

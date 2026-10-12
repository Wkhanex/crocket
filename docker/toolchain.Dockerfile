# crocket's toolchain: Ubuntu 26.04, the ./dev setup packages, and GCC 16.2 from ./dev gcc.
# Published as ghcr.io/sean3z/crocket-toolchain:gcc-16.2 by .github/workflows/toolchain.yml.
FROM ubuntu:26.04
ENV CROCKET_GCC_PREFIX=/opt/gcc-16.2 \
    DEBIAN_FRONTEND=noninteractive
COPY dev /tmp/crocket/dev
RUN /tmp/crocket/dev setup \
 && /tmp/crocket/dev gcc \
 && rm -rf /tmp/crocket /root/.cache/crocket-gcc /var/lib/apt/lists/*
ENV PATH=/opt/gcc-16.2/bin:$PATH
WORKDIR /src

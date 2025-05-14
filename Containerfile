FROM ghcr.io/ublue-os/aurora-dx:latest

### MODIFICATIONS

COPY etc/keyd /etc/keyd/

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
  /tmp/build.sh && \
  ostree container commit


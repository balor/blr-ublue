FROM ghcr.io/ublue-os/bluefin-dx:stable

### MODIFICATIONS

COPY etc/keyd /etc/keyd/

COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
  /tmp/build.sh && \
  ostree container commit


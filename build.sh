#!/bin/bash

set -ouex pipefail

### Install packages

# keyd service
dnf5 -y copr enable alternateved/keyd
dnf5 -y install keyd
dnf5 -y copr disable alternateved/keyd

systemctl enable keyd.service

# btop
dnf5 -y install btop

### Install system flatpaks

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

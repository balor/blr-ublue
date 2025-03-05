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

flatpak remote-add --system flathub https://flathub.org/repo/flathub.flatpakrepo

# flatpaks - comms
flatpak --system install -y flathub org.signal.Signal
flatpak --system install -y flathub com.mattermost.Desktop
flatpak --system install -y flathub com.slack.Slack

# flatpacks - applications
flatpak --system install -y flathub org.kde.ktorrent
flatpak --system install -y flathub org.wezfurlong.wezterm
flatpak --system install -y flathub md.obsidian.Obsidian
flatpak --system install -y flathub app.zen_browser.zen
flatpak --system install -y flathub com.github.wwmm.easyeffects
flatpak --system install -y flathub com.spotify.Client

### Install system flatpaks

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#!/usr/bin/env sh

apt-get update

#install prerequisites
apt-get -y install --no-install-recommends build-essential avahi-daemon avahi-discover avahi-utils libssl-dev libconfig++-dev g++ curl udev autoconf automake cmake git-core libass-dev libfreetype6-dev libgnutls28-dev libmp3lame-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev meson ninja-build pkg-config texinfo wget yasm zlib1g-dev


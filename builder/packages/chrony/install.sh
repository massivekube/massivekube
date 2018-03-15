#!/bin/sh

PKG_ROOT=$(dirname $0)
PKG_FILES=$PKG_ROOT/files

apk add chrony
rc-update add chronyd

mkdir -p /etc/monit.d
cp $PKG_FILES/monit /etc/monit.d/chronyd.conf


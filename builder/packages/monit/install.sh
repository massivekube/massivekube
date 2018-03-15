#!/bin/sh

PKG_ROOT=$(dirname $0)
PKG_FILES=$PKG_ROOT/files

apk add monit
rc-update add monit

mkdir -p /etc/logrotate.d

cp $PKG_FILES/monitrc /etc/monitrc

cp $PKG_FILES/logrotate /etc/logrotate.d/monit

$PKG_ROOT/iptables.sh
#!/bin/sh

PKG_ROOT=$(dirname $0)
PKG_FILES=$PKG_ROOT/files

cp $PKG_FILES/monit /etc/monit.d/sshd.conf

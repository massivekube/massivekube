#!/bin/sh

# Ensure system is up to date
apk update
apk upgrade

# Disabling swap
sed -i '/swap/d' /etc/fstab

$BUILDER_ROOT/packages/iptables/install.sh
$BUILDER_ROOT/packages/fail2ban/install.sh
$BUILDER_ROOT/packages/chrony/install.sh
$BUILDER_ROOT/packages/monit/install.sh

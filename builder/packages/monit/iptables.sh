#!/bin/sh

# Allow localhost access to monit API
iptables -A INPUT -p tcp -s localhost --dport 2812 -j ACCEPT

$BUILDER_ROOT/packages/iptables/save.sh
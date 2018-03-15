#!/bin/sh

# Install iptables
# Install iptables persistence
# Allow port 22

apk add iptables

rc-update add iptables

$(dirname $0)/configure.sh
$(dirname $0)/save.sh
#!/bin/sh
#
# Arranca centerim, tem umha linha em /etc/rc.local
#

echo "Starting centerim com screen..."

screen -dmS centerim /usr/bin/centerim

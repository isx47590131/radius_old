#!/bin/bash
#debug
#/usr/sbin/radiusd -X
/bin/chown -R radiusd.radiusd /var/run/radiusd
/usr/sbin/radiusd -C
/usr/sbin/radiusd -d /etc/raddb

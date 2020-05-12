#!/bin/bash

while true; do
    grep -q '^1$' "/sys/class/net/eth0/carrier" &&
	grep -q '^1$' "/sys/class/net/eth1/carrier" &&
	break

    sleep 1

done

if [[ ! -s /etc/snort/snort.conf ]]; then
    mv /etc/snort/snort.conf.default /etc/snort/snort.conf
fi

if [[ ! -s /etc/snort/rules/local.rules ]]; then
    mv /etc/snort/rules/local.rules.default /etc/snort/rules/local.rules    
fi    

exec /usr/local/bin/snort "$@"

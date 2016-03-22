#!/bin/bash
if [ -d /var/cache/ddclient ]; then
        chown abc:abc /var/cache/ddclient
else
        mkdir /var/run/cache
        chown abc:abc /var/cache/ddclient/
fi

if [ -d /var/run/ddclient ]; then
	chown abc:abc /var/run/ddclient
else
	mkdir /var/run/ddclient
        chown abc:abc /var/run/ddclient/
fi

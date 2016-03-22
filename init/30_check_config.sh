#!/bin/bash

#Check for config, if it doesnt exist, create from sample
if [ -f /config/ddclient.conf ]; then
  echo "Config exists, starting"
else
  echo "Creating config from sample."
  cp /defaults/sample-etc_ddclient.conf /config/ddclient.conf
  sed -i 's:/var/run/ddclient.pid:/var/run/ddclient/ddclient.pid:g' /config/ddclient.conf 
  chown abc:abc /config/ddclient.conf
fi

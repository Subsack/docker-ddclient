FROM linuxserver/baseimage
MAINTAINER David Nilsson <dnilss31@gmail.com>
ARG DEBIAN_FRONTEND="noninteractive"

ENV APTLIST="ddclient"

# Install ddclient
RUN  apt-get -q update && \
  apt-get install -qy $APTLIST && \
  rm /etc/ddclient.conf && \
  ln -s /config/ddclient.conf /etc/ddclient.conf && \
  apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
COPY defaults /defaults
COPY init/ /etc/my_init.d/
COPY services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

VOLUME ["/config"]

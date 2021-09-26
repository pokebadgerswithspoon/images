#!/bin/bash

spamd --username debian-spamd \
      --nouser-config \
      --syslog stderr \
      --socketpath=/var/run/spamd.sock
      --socketowner=debian-spamd
      --pidfile /var/run/spamd.pid \
      --helper-home-dir /var/lib/spamassassin
      --ip-address \
      --allowed-ips 0.0.0.0/0

#!/bin/bash

spamass-milter -I -m -P /var/run/spamd-milter.pid -p inet:784@0.0.0.0 -u debian-spamd -- --socket=/var/run/spamd.sock

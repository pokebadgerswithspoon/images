FROM alpine:3.18

RUN apk add dovecot dovecot-lmtpd dovecot-mysql gettext dovecot-pigeonhole-plugin \
    && rm -rf /var/cache/apk/*
#RUN apk add dovecot-pop3d

# expected
#    - /etc/ssl/dovecot/server.key (private key)
#    - /etc/ssl/dovecot/server.pem (certificate)g
# VOLUME [ "/etc/ssl/dovecot/" ]
# VOLUME [ "/etc/dovecot/local.conf" ]
# VOLUME [ "/etc/dovecot/conf.d/auth-sql.conf.ext" ]

ADD rootfs /
RUN chmod +x /opt/dovecot/fill.sh

ADD rootfs.tpl /opt/dovecot/rootfs.tpl


RUN adduser vmail || echo "Could not add user"
RUN addgroup vmail || echo "Could not add group"
RUN adduser postfix || echo "Could not add user: postfix"
RUN addgroup postfix || echo "Could not add group: postfix"

EXPOSE 24 12345 110 143 993 995
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
    && chmod +x /opt/dovecot/quota-warning.sh

RUN mv /etc/dovecot/dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext.bak

RUN mkdir -p /var/lib/dovecot/sieve/ \
    && cd /var/lib/dovecot/sieve/ \ 
    && sievec default.sieve \
    && cd /var/lib/dovecot \
    && chown -R vmail:vmail sieve/*

ENTRYPOINT ["/entrypoint.sh"]


FROM alpine:3.12

RUN apk add postfix postfix-mysql gettext cyrus-sasl

RUN postconf -e "virtual_mailbox_domains = proxy:mysql:/etc/postfix/mysql/virtual_mailbox_domains.cf" \
    && postconf -e "virtual_mailbox_maps = proxy:mysql:/etc/postfix/mysql/virtual_mailbox_maps.cf" \
    && postconf -e "virtual_alias_maps = proxy:mysql:/etc/postfix/mysql/virtual_alias_maps.cf"
    

RUN postconf -e 'smtpd_use_tls = yes'\
    && postconf -e 'smtpd_tls_auth_only = yes'\
    && postconf -e 'smtp_tls_note_starttls_offer = yes'\
    && postconf -e 'smtpd_tls_cert_file = /etc/ssl/certs/postfix.pem'\
    && postconf -e 'smtpd_tls_key_file = /etc/ssl/private/postfix.pem'

RUN postconf -e 'smtpd_sasl_type = dovecot' \
    && postconf -e 'smtpd_sasl_path = inet:dovecot:12345' \
    && postconf -e 'smtpd_sasl_auth_enable = yes' \
    && postconf -e 'smtpd_recipient_restrictions = permit_sasl_authenticated, permit_mynetworks, reject_unauth_destination'

RUN postconf -e "virtual_transport = lmtp:inet:dovecot:24"    

RUN postconf -e 'myorigin = $mydomain' \
    && postconf -e 'mydestination = localhost' \
    && postconf -e 'inet_interfaces = all' \
    && postconf -e 'inet_protocols = ipv4' \
    && postconf -e 'smtpd_banner = $myhostname ESMTP $mail_name'

RUN postconf -e 'maillog_file=/dev/stdout'

ADD rootfs /
RUN chmod +x /opt/postfix/fill.sh

# Enable submission
### Uncomment settings
RUN sed -e '/submission inet/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/syslog_name=postfix\/submission/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_tls_security_level=encrypt/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_sasl_auth_enable=yes/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_client_restrictions=permit_sasl_authenticated,reject/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_client_restrictions/a \ \ -o smtpd_client_restrictions=permit_sasl_authenticated,reject' -i  /etc/postfix/master.cf \
    && sed -e '/milter_macro_daemon_name=ORIGINATING/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtps.*smtpd/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/syslog_name=postfix\/smtps/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_tls_wrappermode=yes/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_sasl_auth_enable=yes/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_client_restrictions=permit_sasl_authenticated,reject/ s/^#*//' -i /etc/postfix/master.cf \
    && sed -e '/milter_macro_daemon_name=ORIGINATING/ s/^#*//' -i /etc/postfix/master.cf
## Comment settings
RUN sed -e '/smtpd_reject_unlisted_recipient=no/ s/^#*/#/' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_helo_restrictions=\$mua_helo_restrictions/ s/^#*/#/' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_sender_restrictions=\$mua_sender_restrictions/ s/^#*/#/' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_recipient_restrictions=/ s/^#*/#/' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_relay_restrictions=permit_sasl_authenticated,reject/ s/^#*/#/' -i /etc/postfix/master.cf \
    && sed -e '/smtpd_reject_unlisted_recipient=no/ s/^#*/#/' -i /etc/postfix/master.cf 

EXPOSE 587 465 25

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

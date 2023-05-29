FROM alpine:3.18

RUN apk add opendkim

COPY entrypoint.sh /entrypoint.sh

# Kubernetes is able to mount secrect as root only
# so secrect going to be root:root 440
RUN chown opendkim:opendkim -R /etc/opendkim && chmod -R 750 /etc/opendkim

RUN rm -rf /etc/opendkim/*

ENTRYPOINT ["/entrypoint.sh"]

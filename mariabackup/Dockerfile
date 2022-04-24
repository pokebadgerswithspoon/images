# FROM debian:buster-slim

# RUN apt-get update \
#     && apt-get upgrade -y \
#     && apt-get install -y mariadb-backup qpress \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

FROM alpine:20220328

RUN apk update \
    && apk add mariadb-backup \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /backups
VOLUME /backups/mysql /etc/mysql
WORKDIR /backups/mysql

USER nobody
ENTRYPOINT [ "/usr/bin/mariabackup" ]


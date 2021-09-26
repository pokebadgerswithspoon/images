#!/bin/ash

export user=$(cat /opt/postfix/mysql/secret/user)
export password=$(cat /opt/postfix/mysql/secret/password)
export db=$(cat /opt/postfix/mysql/config/db)
export host=mysql

mkdir -p /etc/postfix/mysql/


for filename in /opt/postfix/tpl/*; do
    [ -e "$filename" ] || continue
    f=`basename ${filename}`
    envsubst < ${filename} > "/etc/postfix/mysql/${f}"
done

unset user
unset password
unset db
unset host

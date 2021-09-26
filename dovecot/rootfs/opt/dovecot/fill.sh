#!/bin/sh

DIR=/opt/dovecot
set -o allexport
source $DIR/defaults
cd ${DIR}/env
for filename in $(find ./ -type f); do
    [ -e "$filename" ] || continue
    eval $(basename $filename)=$(cat $filename)
done
set +o allexport

export THIS_POD_IP=${THIS_POD_IP:-$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)}

mkdir -p /etc/dovecot/

SRC=$DIR/rootfs.tpl
DST=/

cd $SRC
for filename in $(find ./ -type f); do
    [ -e "$filename" ] || continue
    f=${DST}${filename}
    echo "# $f"
    rm -f $f
    envsubst < ${filename} > $f
done
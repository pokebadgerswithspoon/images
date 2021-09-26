#!/bin/ash
echo "# Postfix image"
echo "# made it to entrypoint of the image"

# echo "# Enabling OpenDKIM connection"
# postconf -e 'milter_default_action = accept'
# postconf -e 'milter_protocol = 6'
# postconf -e 'smtpd_milters = , inet:opendkim:8891'
# postconf -e 'non_smtpd_milters = $smtpd_milters'

export THIS_POD_IP=${THIS_POD_IP:-$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)}

postconf -e 'mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128' \


echo "# build newaliases"
newaliases

echo "# Filling config templates with mounted values"
/opt/postfix/fill.sh
echo "# next step is to start postfix, hold on..."
postfix start-fg

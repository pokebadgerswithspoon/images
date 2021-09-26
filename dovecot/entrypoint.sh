#!/bin/ash
echo "# Dovecot image"
echo "# made it to entrypoint of the image"

echo "# Filling templates with data to be real configs"
/opt/dovecot/fill.sh
echo "# next step is to start dovecot, hold on..."
# exec /bin/ash
dovecot -F

#!/bin/sh

set -e

if [ "$1" == "sh" ]; then
    exec /bin/sh
fi

confgen /etc/keepalived/keepalived.conf.tmpl > /etc/keepalived/keepalived.conf
exec keepalived -n -l "$@"

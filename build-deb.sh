#!/bin/bash

VERSION=0.1
VENDOR=pistahh

set -e

MYDIR=$(readlink -f $(dirname $0))
OUTPUT=$MYDIR/output
TREE=$MYDIR/tree
rm -rf $OUTPUT $TREE
mkdir -p $OUTPUT

#install -d $TREE/usr/sbin $TREE/usr/share/asknet/templates
install -m 755 -D -t $TREE/usr/sbin asknet-init
install -m 644 -D -t $TREE/usr/share/asknet/templates templates/*
install -m 644 -D -T defaults-example $TREE/etc/default/asknet
install -m 644 -D -t $TREE/lib/systemd/system asknet.service

fpm -t deb \
    -s dir \
    -C $TREE \
    --after-install postinst.sh \
    --after-upgrade postupgr.sh \
    --before-remove prerm.sh \
    -p $OUTPUT \
    -n "asknet-init" \
    -v "$VERSION" \
    -a all \
    -m "Istvan Szekeres <szekeres@iii.hu>" \
    --vendor "$VENDOR" \
    --description "Asknet - network setup interview" \
    --url "https://github.com/Pistahh/asknet" \
    --config-files /etc/default/asknet \
    --license "Unlicense,MIT" \
    --force


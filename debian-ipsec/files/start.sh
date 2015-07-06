#!/bin/bash

$SITE=$1
$SRC=/usr/local/src/ipsec

cp racoon.conf /etc/racoon
cp psk.txt /etc/racoon
cp $SRC/$SITE/ipsec-tools.conf /etc

/usr/sbin/racoon -dF
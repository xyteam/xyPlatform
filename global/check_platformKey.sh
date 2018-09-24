#!/bin/bash

KEYPATH=../global
KEYFILE=platform_id_rsa

KEYFULLPATH=$KEYPATH/$KEYFILE
if [ -f $KEYFULLPATH ] ; then
  if [ ! -f $KEYFULLPATH.pub ] ; then
    ssh-keygen -y -f $KEYFULLPATH  | sed -e "s/$/ xyPlatform/" > $KEYFULLPATH.pub
  fi
else
  ssh-keygen -f $KEYFULLPATH -t rsa -b 4096 -N '' -C xyPlatform
fi

#!/bin/bash
ACTION=$1
shift
TARGET=$@

ALL_List=$(grep win7desktop Vagrantfile | grep -v /#/ | cut -d\" -f2)

if [ "$ACTION" == "List" ] ; then
  echo $ALL_List
  exit 0
fi

if [ "$TARGET" == "ALL" ] ; then
  TARGET=$ALL_List
fi

vagrant $ACTION $TARGET
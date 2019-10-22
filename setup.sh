#!/bin/sh

cd $0
if [ ! -f ./config/biocore.cfg ]
then
   echo "ERROR: ./config/biocore.cfg not found "
   exit 1
fi
if [ ! -f ./config/user.cfg ]
then
   echo "ERROR: ./config/user.cfg not found "
   exit 1
fi

source ./config/biocore.cfg
source ./config/user.cfg
source ./config/.users.cfg

USER_BASE=$MINOTA_BASE/$WS_USER_NAME
[ ! -d $USER_BASE ] && mkdir $USER_BASE

exit 0


#!/bin/sh

cd $0
trinity=`which Trinity`
if [ ! -f $trinity ]
then
   echo "ERROR: Trinity not found on PATH - try typing the command 'which Trinity'"
   exit 1
fi
if [ ! -f ../config/single_reads_trinity.cfg ]
then
   echo "ERROR: ../config/single_reads_trinity.cfg not found "
   exit 1
fi
source ../config/single_reads_trinity.cfg
source ../config/biocore.cfg
source ../config/user.cfg
USER_BASE=$MINOTA_BASE/$WS_USER_NAME
echo "$trinity $CMD_OPTION $READS $CPU_MEM_OPTION"

env

exit 0


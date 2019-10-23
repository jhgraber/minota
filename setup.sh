#!/bin/sh

cd `dirname $0`
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
if [ ${USERS[$WS_USER_NAME]+abc} ]
then
   [ ! -d $USER_BASE ] && mkdir $USER_BASE
   echo "****************************"
   echo ""
   echo "Welcome to MINOTA 2019"
   echo "" 
   echo "****************************"
   echo "Please Note:"
   echo "Your working directory is: $USER_BASE"
   echo "After reading this, run the following commands on a terminal: "
   echo "1)  cd ~/"
   echo "2)  cp -R ~/minota $USER_BASE/workshop_src"
   echo "3)  cd $USER_BASE "
   echo ""
   echo "And Voila!"
else
   echo "Bad username:$WS_USER_NAME - Check that your username was updated correctely in config/user.cfg" 
   exit
fi

exit 0


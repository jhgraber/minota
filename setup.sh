#!/bin/sh

cd `dirname $0`
if [ ! -f ./config/biocore.cfg ]
then
   echo "ERROR: ./config/biocore.cfg not found "
   exit 1

fi
WS_USER_NAME=$1

if [ -z "$WS_USER_NAME" ]
then
   echo ""
   echo "Usage: ./setup.sh user_name"
   echo "Where: user_name is a word composition of your first name and the  "
   echo "       first character of your last name - all in lowercase. "
   echo "       For example: the user_name for Lucie Hutchins would be lucieh "
   echo ""
   exit 1
fi

source ./config/biocore.cfg
source ./config/.users.cfg

USER_BASE=$MINOTA_BASE/$WS_USER_NAME
if [ ${USERS[$WS_USER_NAME]+abc} ]
then
   [ ! -d $USER_BASE ] && mkdir $USER_BASE
   user_name=${USERS[$WS_USER_NAME]}
   cd cd ~/
   cp -R ~/minota/tools $USER_BASE/workshop_src
   cd $USER_BASE
   echo "**********************************************"
   echo ""
   echo "$user_name, Welcome to MINOTA 2019!"
   echo "" 
   echo "**********************************************"
   echo "Please Note:"
   echo "Your working directory is: $USER_BASE"
   echo "Your local copy of Scripts used in the workshop can be found under: $USER_BASE/workshop_src "
   echo ""
   echo ""
   echo "And Voila!"
else
   echo "Bad username:$WS_USER_NAME - Check that your username was updated correctely in config/user.cfg" 
   exit 1
fi

exit 0


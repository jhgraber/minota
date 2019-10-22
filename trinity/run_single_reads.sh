#!/bin/sh

cd $0
if [ ! -f ../config/single_reads_trinity.cfg ]
then
   echo "ERROR: ../config/single_reads_trinity.cfg not found "
   exit 1
fi
source ../config/single_reads_trinity.cfg

env

exit 0


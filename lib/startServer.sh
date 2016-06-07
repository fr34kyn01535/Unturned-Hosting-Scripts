#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/../configuration.sh
INSTANCE_NAME=$1
ulimit -n 2048

cd $UT_UNTURNED_HOME
echo "Starting $INSTANCE_NAME in $UT_UNTURNED_HOME"
./Unturned.x86 -nographics -batchmode -logfile "Servers/$INSTANCE_NAME/unturned.log" +secureserver/$INSTANCE_NAME
echo "Stopped $INSTANCE_NAME"
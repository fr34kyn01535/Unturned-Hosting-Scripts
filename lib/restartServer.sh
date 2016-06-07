#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/../configuration.sh

INSTANCE_NAME=$1
kill $(ps -x | grep [s]ecureserver/$INSTANCE_NAME | awk '{print $1}') 2>/dev/null

echo "starting screen $INSTANCE_NAME"
screen -dmS $INSTANCE_NAME bash -c "$UT_SCRIPTS_HOME/lib/startServer.sh $INSTANCE_NAME"

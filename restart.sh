#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/configuration.sh

for i in `seq 1 $UT_SERVER_COUNT`;
do
	 $UT_SCRIPTS_HOME/lib/updateTemplate.sh
	 $UT_SCRIPTS_HOME/lib/restartServer.sh $UT_MACHINE_NAME$i
done
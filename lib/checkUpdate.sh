#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/../configuration.sh

cd $UT_UNTURNED_HOME
VERSION=$(cat status.txt 2>/dev/null || echo 0)
wget -qN $UT_UPDATE_ADDRESS -O status.txt
NEWVERSION=$(cat status.txt)
echo $VERSION vs $NEWVERSION
if [ "$VERSION" -ne "$NEWVERSION" ] 
then
	echo "Now updating..."
	touch updating.lock
	for i in `seq 1 $UT_SERVER_COUNT`;
	do
		screen -S $UT_MACHINE_NAME$i -p0 -X stuff "$(printf \\r)"
		screen -S $UT_MACHINE_NAME$i -p0 -X stuff "say Shutting down in 60 seconds to update...$(printf \\r)"
	done
	
	sleep 30
	
	for i in `seq 1 $UT_SERVER_COUNT`;
	do
		screen -S $UT_MACHINE_NAME$i -p0 -X stuff "say Shutting down in 30 seconds to update...$(printf \\r)"
	done
	
	sleep 25
	
	for i in `seq 1 $UT_SERVER_COUNT`;
	do
		screen -S $UT_MACHINE_NAME$i -p0 -X stuff "say Updating now...$(printf \\r)"
		screen -S $UT_MACHINE_NAME$i -p0 -X stuff "save$(printf \\r)"
	done 
	
	sleep 5
	
	for i in `seq 1 $UT_SERVER_COUNT`;
	do
		screen -S $UT_MACHINE_NAME$i -p0 -X stuff "shutdown$(printf \\r)"
	done

	$UT_SCRIPTS_HOME/lib/updateTemplate.sh
	$UT_SCRIPTS_HOME/lib/updateUnturned.sh
	$UT_SCRIPTS_HOME/lib/updateRocket.sh
	$UT_SCRIPTS_HOME/lib/updatePlugins.sh
	 
	for i in `seq 1 $UT_SERVER_COUNT`;
	do
		 $UT_SCRIPTS_HOME/lib/restartServer.sh $UT_MACHINE_NAME$i
	done
	rm updating.lock
else
	if [ ! -f "updating.lock" ]; then
		echo "No update available!"
		for i in `seq 1 $UT_SERVER_COUNT`;
		do
			if ! screen -list | grep $UT_MACHINE_NAME$i; then
				 $UT_SCRIPTS_HOME/lib/restartServer.sh $UT_MACHINE_NAME$i
			fi
		done
	else
		echo "Currently updating!"
	fi
fi
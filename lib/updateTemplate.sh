#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/../configuration.sh
rm $UT_SCRIPTS_HOME/template/ -R 2>/dev/null
rsync -azbe ssh unturned@unturned.rocks:/home/unturned/scripts /home/steam
chmod 777 /home/steam/scripts -R

for i in `seq 1 $UT_SERVER_COUNT`;
do
	rm "$UT_UNTURNED_HOME/Servers/$UT_MACHINE_NAME$i/Rocket/Plugins/*" -R
	cp "$UT_SCRIPTS_HOME/template/Rocket" "$UT_UNTURNED_HOME/Servers/$UT_MACHINE_NAME$i/" -R
done
cp "$UT_SCRIPTS_HOME/template/Workshop" "$UT_UNTURNED_HOME/Bundles/" -R
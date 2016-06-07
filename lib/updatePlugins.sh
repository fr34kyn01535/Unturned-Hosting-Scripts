#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/../configuration.sh


mkdir "$UT_SCRIPTS_HOME/tmp" -p
cd "$UT_SCRIPTS_HOME/tmp"

wget "https://ci.unturned.rocks/job/GlobalBan/lastSuccessfulBuild/artifact/bin/Release/GlobalBan.zip"
wget "https://ci.unturned.rocks/job/MessageAnnouncer/lastSuccessfulBuild/artifact/bin/Release/MessageAnnouncer.zip"
wget "https://ci.unturned.rocks/job/Uconomy/lastSuccessfulBuild/artifact/bin/Release/Uconomy.zip"
wget "https://ci.unturned.rocks/job/Votifier/lastSuccessfulBuild/artifact/bin/Release/Votifier.zip"

unzip -o \*.zip

for i in `seq 1 $UT_SERVER_COUNT`;
do
	cp "*.dll" "$UT_UNTURNED_HOME/Servers/$UT_MACHINE_NAME$i/Rocket/Plugins/"
done
rm "$UT_SCRIPTS_HOME/tmp"
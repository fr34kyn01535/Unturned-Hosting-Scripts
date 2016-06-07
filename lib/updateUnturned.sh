#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/../configuration.sh

mkdir -p $UT_STEAMCMD_HOME
mkdir -p $UT_UNTURNED_HOME

cd $UT_STEAMCMD_HOME
if [ ! -f "steamcmd.sh" ]; then
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	tar -xvzf steamcmd_linux.tar.gz
	rm steamcmd_linux.tar.gz
fi

./steamcmd.sh +@sSteamCmdForcePlatformBitness 32 +login $UT_STEAM_USERNAME $UT_STEAM_PASSWORD +force_install_dir $UT_UNTURNED_HOME +app_update 304930 validate +exit
cd $UT_UNTURNED_HOME

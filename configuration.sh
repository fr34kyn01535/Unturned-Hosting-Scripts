#!/bin/bash
export UT_STEAM_USERNAME="" #STEAM USERNAME HERE
export UT_STEAM_PASSWORD="" #STEAM PASSWORD HERE
export UT_API_KEY="" #ROCKET API KEY HERE
export UT_STEAMCMD_HOME="/home/steam/steamcmd"
export UT_UNTURNED_HOME="/home/steam/unturned"
export UT_SCRIPTS_HOME="/home/steam/scripts"
export UT_MACHINE_NAME=$(hostname -s)
export UT_SERVER_COUNT=2
export UT_DEFAULT_MODE="Normal"
export UT_UPDATE_ADDRESS="http://api.unturned.rocks/unturned-linux.txt"
export DISPLAY=:0.0

if [ -f $UT_SCRIPTS_HOME/configuration.custom.sh ]; then
	. $UT_SCRIPTS_HOME/configuration.custom.sh
fi
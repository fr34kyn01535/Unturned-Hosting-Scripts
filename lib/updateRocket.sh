#!/bin/bash
CURRENT_FOLDER=$(dirname $0)
. $CURRENT_FOLDER/../configuration.sh

cd $UT_UNTURNED_HOME/Unturned_Data/Managed/
wget http://api.rocketmod.net/download/unturned-linux/latest/$UT_API_KEY/Rocket.zip
unzip -o Rocket.zip
rm Rocket.zip

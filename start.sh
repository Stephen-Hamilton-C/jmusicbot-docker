#!/bin/bash

set -e
CONFIG_FILE=/bot/config.txt

cd /bot

if [ ! -f $CONFIG_FILE ] || [ "$OVERWRITE_CONFIG" == "yes" ]
then
	envsubst < /bot/config.txt.template > /bot/config.txt
fi

java -Dnogui=true -jar JMusicBot.jar


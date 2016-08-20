#!/bin/zsh

declare -i ID
ID=12
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
    #echo "Touchpad disabled."
    notify-send 'Touchpad' 'Disabled' 
else
    xinput enable $ID
    #echo "Touchpad enabled."
    notify-send 'Touchpad' 'Enabled'
fi

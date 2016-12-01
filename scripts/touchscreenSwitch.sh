#! /bin/bash

DEVICE="ELAN Touchscreen"
STATUS=`xinput list-props "$DEVICE" | grep 'Device Enabled' | sed 's/.*\([0-9]\)$/\1/'`
ICON=`readlink -f ~/dotfiles/scripts/touch-screen.png`

if [ "$STATUS" = "1" ]
then
	xinput set-prop "$DEVICE" 'Device Enabled' 0
	echo "Touch-screen disabled"
	notify-send "Touch-screen" "Disabled" -i $ICON
elif [ "$STATUS" = "0" ]
then
	xinput set-prop "$DEVICE" 'Device Enabled' 1
	echo "Touch-screen enabled"
	notify-send "Touch-screen" "Enabled" -i $ICON
else
	echo "Error: Touch-screen status toggel problem"
	notify-send "Error: Touch-screen status toggel problem" -i $ICON
fi


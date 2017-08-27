#!/bin/bash

if pgrep compton &>/dev/null; then
	echo "Turning compton OFF"
	pkill compton &
else
	echo "Turning compton ON"
	compton -b &
fi

exit 0


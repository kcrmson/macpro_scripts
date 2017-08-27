#!/bin/bash

if pgrep i3lock-fancy &>/dev/null; then
	exit 0
else
	i3lock-fancy -p &
fi

exit 0


#! /bin/bash

s="$(echo "$1" | sed -e "s/viewtube://")"
v="$(echo "$s" | awk -F '|' '{print $1}')"
a="$(echo "$s" | awk -F '|' '{print $2}')"
if [ "$a" = "" ]; then
   mpv --osc --fs --ytdl=yes "$v"
   #cvlc -f "$v"
else
   mpv --osc --fs --ytdl=yes --audio-file "$a" "$v"
   #cvlc -f --input-slave "$a" "$v"
fi 


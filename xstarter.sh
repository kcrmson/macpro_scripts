#!/bin/bash
#xstarter.sh
WM_LIST=( ' '  'Openbox'  'Antico'  'XFCE'  'Awesome'  'WMFS'  'I3'  'Subtle' 'Tinywm' 'Console')
TOTAL_WMS=9
#need to assign the $TERM comparison to a variable
#same goes for the console comparison

if  [  $TERM == 'linux' ]; then
    echo  'Please select one:'
    for ((i=1; i<=$TOTAL_WMS;  i++))
    do
        echo  "$i. ${WM_LIST[$i]}"
    done
    echo  ' '
    read -n 1 choice
    echo " "
    echo "Your choice: ${WM_LIST[$choice]}"
    if  [ "${WM_LIST[$choice]}" != "Console" ]; then
        xinit  ${WM_LIST[$choice]} 
    fi
fi
exit 0


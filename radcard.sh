#!/bin/bash

# radcard
# Script to control radeon DPM power saving, run as root
# Ref: https://wiki.archlinux.org/index.php/ATI#Powersaving
# Version: 2016-05-08
# License: GPLv3
# Authors: jamie.bainbridge@gmail.com

if [ "$EUID" -ne 0 ]
then
    echo "* [ERROR] Run this script under 'sudo -s' or as root"
    exit 1
fi

CARDPATH="/sys/class/drm/card0/device"
CARDPATH1="/sys/class/drm/card1/device"

do_set()
{
    case "$1" in
        bat*)
            echo battery > "$CARDPATH"/power_dpm_state
            echo battery > "$CARDPATH1"/power_dpm_state
            ;;
        bal*)
            echo balanced > "$CARDPATH"/power_dpm_state
            echo balanced > "$CARDPATH1"/power_dpm_state
            ;;
        per*)
            echo performance > "$CARDPATH"/power_dpm_state
            echo performance > "$CARDPATH1"/power_dpm_state
            ;;
        auto*)
            echo auto > "$CARDPATH"/power_dpm_force_performance_level
            echo auto > "$CARDPATH1"/power_dpm_force_performance_level
            ;;
        low)
            echo low > "$CARDPATH"/power_dpm_force_performance_level
            echo low > "$CARDPATH1"/power_dpm_force_performance_level
            ;;
        high)
            echo high > "$CARDPATH"/power_dpm_force_performance_level
            echo high > "$CARDPATH1"/power_dpm_force_performance_level
            ;;
        *)
            echo "Usage: $(basename "$0") set [battery|balanced|performance|auto|low|high]"
            exit 1
            ;;
    esac
}

do_get()
{
    echo -n "card0 power_dpm_state: "; cat "$CARDPATH"/power_dpm_state
    echo -n "card1 power_dpm_state: "; cat "$CARDPATH1"/power_dpm_state
    echo -n "card0 power_dpm_force_performance_level: "; cat "$CARDPATH"/power_dpm_force_performance_level
    echo -n "card1 power_dpm_force_performance_level: "; cat "$CARDPATH1"/power_dpm_force_performance_level
}

do_usage()
{
    echo "Usage: $(basename "$0") [get|set powerlevel]"
}

case "$1" in
    set)
        do_set $2
        do_get
        ;;
    get)
        do_get
        ;;
    *)
        do_usage
        exit 1
        ;;
esac

exit 0

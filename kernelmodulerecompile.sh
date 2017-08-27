#!/bin/bash

sudo mkinitcpio -p linux && sudo mkinitcpio -p linux-lts && sudo mkinitcpio -p linux-zen

# && sudo modprobe acpi_call && lsmod | grep acpi_call


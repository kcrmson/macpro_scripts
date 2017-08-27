#!/bin/bash

sudo reflector --country "United States" -p http --age 8 --sort rate | sudo tee /tmp/mirrorlist ; sudo mv -i /tmp/mirrorlist /etc/pacman.d/mirrorlist


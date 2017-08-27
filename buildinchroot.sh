#!/bin/bash

CHROOT="/home/suchstaffies/scratch/chroot$1"

# clean out the old chroots
#sudo rm -rf /scratch/chroot64/{*,.*}
#sudo rm -rf /scratch/chroot64/.*
#sudo rm -rf /scratch/chroot32/{*,.*}
#sudo rm -rf /scratch/chroot32/.*

# create and update the chroot, include base-devel and ccache
# as well as any braced variables after the first
#sudo ccm c s $CHROOT/root base-devel ccache $2

# build in the chroot and install to the chroot
makechrootpkg -c -r $CHROOT -- -i


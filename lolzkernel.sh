#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

LOLZDIR="$(pwd)/lolz"

# Github info
git config --global user.name "Jprimero15"
git config --global user.email "jprimero15@aospa.co"



git clone https://github.com/Jprimero15/lolz_rebase -b v18-next --depth=1 $LOLZDIR

rm -rf $LOLZDIR/KernelSU # always remove
git clone https://github.com/backslashxx/KernelSU -b master $LOLZDIR/KernelSU

# kernel: Fix kallsyms symbol size type mismatch
git -C $LOLZDIR/KernelSU fetch https://github.com/Jprimero15/KernelSU.git master && git -C $LOLZDIR/KernelSU cherry-pick c5cc2a4a3ac0a6a3ea2504edaca74e2e9ed9bf63

# note 3 based Script
cd $LOLZDIR && bash builder.sh

#cd $LOLZDIR && bash builder.sh hltechn

#cd $LOLZDIR && bash builder.sh hltekor

#cd $LOLZDIR && bash builder.sh hltetmo

# End of Script

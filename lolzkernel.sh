#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

LDIR="$(pwd)/lolz"

# Github info
git config --global user.name "Jprimero15"
git config --global user.email "jprimero15@aospa.co"

git clone https://github.com/Jprimero15/lolz_rebase -b v18-next --depth=1 $LDIR

git clone https://github.com/kdrag0n/proton-clang -b master --depth=1 $LDIR/clang15

rm -rf $LDIR/KernelSU # always remove
git clone https://github.com/backslashxx/KernelSU -b master $LDIR/KernelSU

# note 3 based Script
cd $LDIR && bash builder.sh

#cd $LDIR && bash builder.sh hltechn

#cd $LDIR && bash builder.sh hltekor

#cd $LDIR && bash builder.sh hltetmo

# End of Script

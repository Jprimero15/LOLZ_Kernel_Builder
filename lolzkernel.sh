#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

LOLZDIR="$(pwd)/lolz"

# Github info
git config --global user.name "Jprimero15"
git config --global user.email "jprimero15@aospa.co"

git clone https://github.com/Jprimero15/lolz_rebase -b v18-next --depth=1 $LOLZDIR

git clone https://gitlab.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-r596125 -b 16.0 $LOLZDIR/clang_tc
cd $LOLZDIR/clang_tc && git lfs install && git lfs pull && cd $LOLZDIR
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9 -b lineage-19.1 --depth=1 $LOLZDIR/gcc_tc

rm -rf $LOLZDIR/KernelSU # always remove
git clone https://github.com/backslashxx/KernelSU -b master $LOLZDIR/KernelSU

# note 3 based Script
cd $LOLZDIR && bash builder.sh

#cd $LOLZDIR && bash builder.sh hltechn

#cd $LOLZDIR && bash builder.sh hltekor

#cd $LOLZDIR && bash builder.sh hltetmo

# End of Script

#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

LOLZDIR="$(pwd)/lolz"

# Github info
git config --global user.name "Jprimero15"
git config --global user.email "jprimero15@aospa.co"



git clone https://github.com/Jprimero15/lolz_rebase -b v18-next --depth=1 $LOLZDIR

mkdir -p $LOLZDIR/clang_tc && curl -L "https://github.com/ZyCromerZ/Clang/releases/download/15.0.7-20260801-release/Clang-15.0.7-20260801.tar.gz" | tar -xz -C $LOLZDIR/clang_tc

rm -rf $LOLZDIR/KernelSU # always remove
git clone https://github.com/backslashxx/KernelSU -b v3.3.0-18 $LOLZDIR/KernelSU

# note 3 based Script
cd $LOLZDIR && bash builder.sh

#cd $LOLZDIR && bash builder.sh hltechn

#cd $LOLZDIR && bash builder.sh hltekor

#cd $LOLZDIR && bash builder.sh hltetmo

# End of Script

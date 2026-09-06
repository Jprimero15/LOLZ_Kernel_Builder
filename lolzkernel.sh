#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

LOLZDIR="$(pwd)/lolz"

# Github info
git config --global user.name "Jprimero15"
git config --global user.email "jprimero15@aospa.co"



git clone https://github.com/Jprimero15/lolz_rebase -b v18-next --depth=1 $LOLZDIR

curl -L https://github.com/ZyCromerZ/Clang/releases/download/14.0.6-20250704-release/Clang-14.0.6-20250704.tar.gz | tar -xz -C $LOLZDIR/clang_tc

rm -rf $LOLZDIR/KernelSU # always remove
git clone https://github.com/backslashxx/KernelSU -b v3.3.0-18 $LOLZDIR/KernelSU

# note 3 based Script
cd $LOLZDIR && bash builder.sh

#cd $LOLZDIR && bash builder.sh hltechn

#cd $LOLZDIR && bash builder.sh hltekor

#cd $LOLZDIR && bash builder.sh hltetmo

# End of Script

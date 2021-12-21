#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

LOLZ_DIR="$(pwd)"

# Github info
git config --global user.name "Jprimero15"
git config --global user.email "jprimero155@gmail.com"

git clone https://github.com/Jprimero15/lolz_rebase -b builder --depth=1 $LOLZ_DIR/lolz

git clone https://github.com/Jprimero15/lolz-clang -b main --depth=1 $LOLZ_DIR/lolz/clang14

# note 3 based Script
cd $LOLZ_DIR/lolz && bash builder.sh

cd $LOLZ_DIR/lolz && bash builder.sh hltechn

cd $LOLZ_DIR/lolz && bash builder.sh hltekor

cd $LOLZ_DIR/lolz && bash builder.sh hltetmo

# End of Script

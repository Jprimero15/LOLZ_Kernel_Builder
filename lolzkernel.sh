#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

ZDIR="$(pwd)"

# clone scripts boi
git clone https://Jprimero15:$GITHUB_TOKEN@github.com/Jprimero15/lolz-clang-build -b new --depth=1 $ZDIR/builder

# LOLZ CLANG Builder Script
cd $ZDIR/builder && bash build_lolz.sh

# End of Script

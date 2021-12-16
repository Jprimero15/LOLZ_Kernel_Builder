#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

ZDIR="$(pwd)"

# clone scripts boi
git clone https://github.com/Jprimero15/lolz-clang -b main --depth=1 $ZDIR/builder

# LOLZ CLANG Builder Script
cd $ZDIR/lolz && bash $ZDIR/builder/build_lolz.sh

# End of Script

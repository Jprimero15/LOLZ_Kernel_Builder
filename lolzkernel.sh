#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

LOLZ_DIR="$(pwd)"

# Github info
git config --global user.name "Jprimero15"
git config --global user.email "jprimero155@gmail.com"

# Inlined function to post a message
export BOT_MSG_URL="https://api.telegram.org/bot$TG_BOT_TOKEN/sendMessage"
function tg_post_msg() {
    curl -s -X POST "$BOT_MSG_URL" -d chat_id="-1001366235952" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1"
}

# Send a notificaton to TG
tg_post_msg "<b>LOLZ KERNEL Compilation Started (BUILT-IN WLAN)</b>"

git clone https://Jprimero15:$GITHUB_TOKEN@github.com/Jprimero15/lolzbuilder -b master $LOLZ_DIR/builder 

git clone https://github.com/Jprimero15/lolz_kernel_redmi8 -b v14_binder --depth=1 $LOLZ_DIR/lolz

git clone https://gitlab.com/Panchajanya1999/azure-clang -b main --depth=1 $LOLZ_DIR/lolz/clang14

cd $LOLZ_DIR/lolz/clang14 && git reset --hard 3f4967da0babd918b2258541bbb7fc7fa8be5af8 && $LOLZ_DIR

cd $LOLZ_DIR/lolz && bash $LOLZ_DIR/builder/lolzbuilder.sh

# Send a notificaton to TG
tg_post_msg "<b>LOLZ KERNEL Compilation Completed (BUILT-IN WLAN)</b>"

# End of Script

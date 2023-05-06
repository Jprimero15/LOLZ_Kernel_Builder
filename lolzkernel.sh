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
    curl -s -X POST "$BOT_MSG_URL" -d chat_id="$TG_CHATID" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" \
        -d text="$1"
}

# Send a notificaton to TG
tg_post_msg " <b>LOLZ KERNEL Compilation Started (4.9-stock).</b>"

git clone --recurse-submodules https://github.com/MI439-CLO/android_kernel_xiaomi_sdm439 -b slmk --depth=1 $LOLZ_DIR/lolz

git clone https://Jprimero15:$GITHUB_TOKEN@github.com/Jprimero15/lolzbuilder -b master $LOLZ_DIR/lolz/builder

# 4.9 stock
cd $LOLZ_DIR/lolz && bash $LOLZ_DIR/lolz/builder/stock_lolzbuilder.sh

# Send a notificaton to TG
tg_post_msg "<b>LOLZ KERNEL Compilation Completed (4.9-stock).</b>"

# End of Script

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
tg_post_msg " <b>LOLZ KERNEL Compilation Started. </b>
       
<b>Some Informations about Build Types: </b>
<b>BUILT-IN WLAN: <code>This is for Android 10,11 and 12 AOSP Based Custom ROMs, e.g. CrDroid.</code></b>
<b>MODULE_WLAN: <code>This is for Android 10 MIUI Based ROMs and GSI. </code></b>

<b>For more questions just message on this group and mention Jprimero15 (DO NOT DIRECT MESSAGE HIM)</b> "

git clone https://Jprimero15:$GITHUB_TOKEN@github.com/Jprimero15/lolzbuilder -b master $LOLZ_DIR/builder 

git clone https://github.com/Jprimero15/lolz_kernel_redmi8 -b V20 --depth=1 $LOLZ_DIR/lolz

# for AOSP based Script
cd $LOLZ_DIR/lolz && bash $LOLZ_DIR/builder/unify_lolzbuilder.sh aosnwowajsiwjwoeudu

# for MIUI based Script
cd $LOLZ_DIR/lolz && bash $LOLZ_DIR/builder/unify_lolzbuilder.sh miui

# Send a notificaton to TG
tg_post_msg "<b>LOLZ KERNEL Compilation Completed</b>"

# End of Script

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

#git clone https://github.com/kdrag0n/proton-clang -b master --depth=1 $LOLZ_DIR/lolz/clang14

git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 -b android-12.0.0_r16 --depth=1 $LOLZ_DIR/lolz/arm-gcc
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 b android-12.0.0_r16 --depth=1 $LOLZ_DIR/lolz/arm64-gcc

mkdir -p $LOLZ_DIR/lolz/clang14
cd $LOLZ_DIR/lolz/clang14
wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-r437112.tar.gz && tar xvf clang-r437112.tar.gz

cd $LOLZ_DIR/lolz && bash $LOLZ_DIR/builder/lolzbuilder.sh

# Send a notificaton to TG
tg_post_msg "<b>LOLZ KERNEL Compilation Completed (BUILT-IN WLAN)</b>"

#upload to telegram
curl -F "document=@$LOLZ_DIR/lolz/out/.config" --form-string "caption=*Just Ignore this file*" "https://api.telegram.org/bot$TG_BOT_TOKEN/sendDocument?chat_id=-1001366235952&parse_mode=MarkdownV2"

# End of Script

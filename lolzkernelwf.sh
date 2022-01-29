#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

        export TZ=Asia/Manila
        ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
        apt-get -y update && apt-get -y upgrade && apt-get -y install git libxml2 python3-pip default-jre tzdata
        apt-get -y install gcc llvm lld g++-multilib clang python3 python3-pip default-jre
        apt-get -y update && apt-get -y upgrade && apt-get -y install git automake lzop bison gperf build-essential zip curl zlib1g-dev g++-multilib libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng bc libstdc++6 libncurses5 wget python3 python3-pip python gcc clang libssl-dev rsync flex git-lfs libz3-dev libz3-4 axel tar patchelf && \
        python3 -m pip  install networkx && \
        apt-get install -y --no-install-recommends \
        bc \
        bison \
        ca-certificates \
        clang \
        cmake \
        curl \
        file \
        flex \
        gcc \
        g++ \
        git \
        libelf-dev \
        libssl-dev \
        lld \
        make \
        ninja-build \
        python3 \
        texinfo \
        xz-utils \
        zlib1g-dev

ZDIR="$(pwd)"

# clone scripts boi
git clone https://Jprimero15:$GITHUB_TOKEN@github.com/Jprimero15/lolz-clang-build -b new --depth=1 $ZDIR/builder

# LOLZ CLANG Builder Script
cd $ZDIR/builder && bash build_lolz.sh

# End of Script

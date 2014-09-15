#!/bin/bash 

# This script is based on projects below
# https://github.com/yixia/FFmpeg-Android
# http://git.videolan.org/?p=vlc-ports/android.git;a=summary

#----------
UNI_BUILD_ROOT=`pwd`
FF_TARGET=$1
set -e
set +x

FF_ALL_ARCHS="armv5 armv7a x86"

echo_archs() {
    echo "===================="
    echo "[*] check archs"
    echo "===================="
    echo "FF_ALL_ARCHS = $FF_ALL_ARCHS"
    echo ""
}

#----------
if [ "$FF_TARGET" = "armv5" -o "$FF_TARGET" = "armv7a" ]; then
    echo_archs
    sh tools/do-compile-ffmpeg.sh $FF_TARGET
elif [ "$FF_TARGET" = "x86" ]; then
    echo_archs
    sh tools/do-compile-ffmpeg.sh $FF_TARGET
elif [ "$FF_TARGET" = "all" ]; then
    echo_archs
    for ARCH in $FF_ALL_ARCHS
    do
        sh tools/do-compile-ffmpeg.sh $ARCH
    done
elif [ "$FF_TARGET" == "check" ]; then
    echo_archs
elif [ "$FF_TARGET" == "clean" ]; then
    echo_archs
    for ARCH in $FF_ALL_ARCHS
    do
        cd ffmpeg-$ARCH && git clean -xdf && cd -
    done
    rm -rf ./build/ffmpeg-*
else
    echo "Usage:"
    echo "  compile-ffmpeg.sh arm|armv7a|x86"
    echo "  compile-ffmpeg.sh all"
    echo "  compile-ffmpeg.sh clean"
    echo "  compile-ffmpeg.sh check"
    exit 1
fi

#----------
echo "\n--------------------"
echo "[*] Finished"
echo "--------------------"
echo "# to continue to build ijkplayer, run script below,"
echo "sh compile-ijk.sh "

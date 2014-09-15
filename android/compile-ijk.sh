#! /usr/bin/env bash

cd ijkmediaplayer/jni
${ANDROID_NDK}/ndk-build
cd -

cd ijkmediaplayer-armv5/jni
${ANDROID_NDK}/ndk-build
cd -

cd ijkmediaplayer-x86/jni
${ANDROID_NDK}/ndk-build
cd -

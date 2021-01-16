#!/bin/sh
make O=out clean
make O=out mrproper
make O=out ARCH=arm64 phoenix_defconfig
export ARCH=arm64 && export SUBARCH=arm64
export CROSS_COMPILE=$(pwd)/gcc/bin/aarch64-linux-android-
PATH="$(pwd)/tc/bin:$(pwd)/gcc/bin:$(pwd)/gcc32/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
                      CROSS_COMPILE_ARM32=arm-linux-androideabi-


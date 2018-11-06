#!/usr/bin/env bash

set -e
set -x

IMG=mycroft-neon.img

qemu-img create $IMG 8G
parted -s $IMG mklabel msdos
parted -s $IMG mkpart primary fat16 8192s 137215s
parted -s $IMG mkpart primary ext4 137216s 100%

DEVICE=$(losetup -f)
sudo losetup $DEVICE $IMG
sudo partprobe $DEVICE

BOOT="${DEVICE}p1"
ROOTFS="${DEVICE}p2"
sudo mkfs.fat -F 16 -I $BOOT
sudo mkfs.ext4 $ROOTFS

TMP=$(mktemp -d)

sudo mount $BOOT $TMP
if [ -e boot/image.ub ]; then
    cp boot/image.ub $TMP
else
    echo "W: No boot/image.ub file found!"
fi

if [ -e boot/BOOT.bin ]; then
    cp boot/BOOT.bin $TMP
else
    echo "W: No boot/BOOT.bin file found!"
fi

sudo umount $TMP

sudo mount $ROOTFS $TMP
sudo tar xf $1 -C $TMP
sudo umount $TMP

sudo losetup -D $DEVICE
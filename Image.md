# Image building

We'll be using the assets/build_img.sh script to accomplish building a img.
In order to build the image, we'll first need a tarball with our target rootfs.
You can generate your own using ubuntu's debootstrap and adding your own repos
and packages as required OR ask KDE Neon to provide you with one.

For the purposes of documentation, we have a prebuilt rootfs tarball that was
provided by KDE Neon ("xenon-rootfs.tar.gz").

## Requirements

* Prebuilt rootfs
* boot/ folder with image.ub and BOOT.bin

## Steps

* mkdir /tmp/img
* cp xenon-rootfs.tar.gz /tmp/img/
* cp assets/build_img.sh /tmp/img/
* cp -aR boot /tmp/img/
* cd /tmp/img/ && ./build_img.sh xenon-rootfs.tar.gz

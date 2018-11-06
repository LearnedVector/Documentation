# Building the Kernel
On a Ubuntu 18.04 system:

* sudo apt install gcc-aarch64-linux-gnu
* export ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
* git clone https://github.com/mycroft-dev/linux-xlnx -b xlnx_rebase_v4.14_2018.2_mycroft_mk2
* make mycroft_mk2_defconfig
* make -j$(nproc)

This generates arch/arm64/boot/Image.gz which we will use later.

## FIT Image generation
The board expects the kernel to be packed with the device tree into a FIT image which is described in
assets/mycroft-mk2.its

NOTE: Make sure the file names are exact. Folder paths are irrelevant though.

* mkdir /tmp/FIT/
* cp arch/arm64/boot/Image.gz /tmp/FIT/
* dtc arch/arm64/boot/dts/xilinx/mycroft-mk2.dts -o /tmp/FIT/mycroft-mk2.dtb
* cp assets/mycroft-mk2.its /tmp/FIT/
* cd /tmp/FIT/ && mkimage -f mycroft-mk2.its image.ub

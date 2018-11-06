# Building the Kernel
On a Ubuntu 18.04 system:

* sudo apt install gcc-aarch64-linux-gnu
* export ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
* git clone https://github.com/mycroft-dev/linux-xlnx -b xlnx_rebase_v4.14_2018.2_mycroft_mk2
* make mycroft_mk2_defconfig

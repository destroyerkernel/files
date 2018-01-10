# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Destroyer™ Kernel by Manik Chathli
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=potter
device.name2=potter_retail
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chmod -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes
insert_line init.qcom.rc "init.destroyer.rc" after "import init.mmi.rc" "import init.destroyer.rc";
# end ramdisk changes

write_boot;

## end install


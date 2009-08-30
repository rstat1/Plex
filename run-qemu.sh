#!/bin/sh
clear

sh make-kernel.sh
qemu -boot a -s -no-kqemu -fda image1.img

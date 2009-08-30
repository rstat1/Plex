#!/bin/sh
clear
mount -t msdos image1.img /mnt -o loop
rm bin/kernel.bin
rm obj/main.o

gcc -O3 -nostdlib -nodefaultlibs -fno-stack-protector -fno-builtin -nostdinc -O -g -m32 -Wall -I. -c -o obj/textmode.o src/textmode.cpp
gcc -O3 -nostdlib -nodefaultlibs -fno-stack-protector -fno-builtin -nostdinc -O -g -m32 -Wall -I. -c -o obj/main.o src/main.cpp
gcc -O3 -nostdlib -nodefaultlibs -fno-stack-protector -fno-builtin -nostdinc -O -g -m32 -Wall -I. -c -o obj/system.o src/system.cpp
gcc -O3 -nostdlib -nodefaultlibs -fno-stack-protector -fno-builtin -nostdinc -O -g -m32 -Wall -I. -c -o obj/Interrupts.o src/Interrupts.cpp
gcc -O3 -nostdlib -nodefaultlibs -fno-stack-protector -fno-builtin -nostdinc -O -g -m32 -Wall -I. -c -o obj/timer.o src/timer.cpp
gcc -O3 -nostdlib -nodefaultlibs -fno-stack-protector -fno-builtin -nostdinc -O -g -m32 -Wall -I. -c -o obj/mm.o src/mm.cpp
nasm -f elf -o obj/load.o src/asm/loader.s

ld -T linker.ld -o bin/kernel.bin obj/Interrupts.o obj/load.o obj/mm.o obj/timer.o obj/textmode.o obj/main.o obj/system.o 

cp bin/kernel.bin /mnt/boot/kernel.bin
cp bin/kernel.bin /mnt/boot/kernel.bin

chown kernel bin/kernel.bin obj/main.o

echo "Kernel Image generated succesfully!"
umount /mnt

#!/bin/sh
clear
mount -t msdos image1.img /mnt -o loop
rm bin/kernel.bin
rm obj/main.o

g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c -o obj/textmode.o src/textmode.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c -o obj/main.o src/main.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c -o obj/system.o src/system.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c -o obj/Interrupts.o src/Interrupts.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c -o obj/timer.o src/timer.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c -o obj/mm.o src/mm.cpp
nasm -f elf -o obj/load.o src/asm/loader.s

ld -T linker.ld -o bin/kernel.bin obj/Interrupts.o obj/load.o obj/mm.o obj/timer.o obj/textmode.o obj/main.o obj/system.o 

cp bin/kernel.bin /mnt/boot/kernel.bin
cp bin/kernel.bin /mnt/boot/kernel.bin

chown kernel bin/kernel.bin obj/main.o

echo "Kernel Image generated succesfully!"
umount /mnt

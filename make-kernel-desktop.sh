#!/bin/sh
clear

rm /home/kernel/Desktop/current\ work/bin/kernel.bin
rm /home/kernel/Desktop/current\ work/obj/main.o
rm /home/kernel/fd0/boot/kernel.bin

g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin --sysroot="/home/kernel/current\ work/src/include" -c -o obj/textmode.o src/textmode.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin --sysroot="/home/kernel/current\ work/src/include" -c -o obj/main.o src/main.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin --sysroot="/home/kernel/current\ work/src/include" -c -o obj/system.o src/system.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin --sysroot="/home/kernel/current\ work/src/include" -c -o obj/Interrupts.o src/Interrupts.cpp
g++ -Wall -g -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin --sysroot="/home/kernel/current\ work/src/include" -c -o obj/timer.o src/timer.cpp
nasm -f elf -o obj/load.o src/asm/loader.s

ld -T linker.ld -o bin/kernel.bin obj/Interrupts.o obj/load.o  obj/textmode.o obj/main.o obj/system.o obj/timer.o  

cp /home/kernel/Desktop/current\ work/bin/kernel.bin /home/kernel/fd0/boot/kernel.bin
cp /home/kernel/Desktop/current\ work/bin/kernel.bin /home/kernel/fd0/boot/kernel.bin

chown kernel bin/kernel.bin obj/main.o

echo "Kernel Image generated succesfully!"


#!/bin/sh
clear

rm /home/rstat1/Desktop/current\ work/bin/kernel.bin
rm /home/rstat1/Desktop/current\ work/obj/kernel.o
rm /home/rstat1/fd0/boot/kernel.bin

fbc -c src/video.bas -o obj/video.o
fbc -c src/kernel.bas -o obj/kernel.o
fbc -c src/gdt.bas -o obj/gdt.o
gcc -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o obj/main.o src/main.c
gcc -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o obj/textmode.o src/textmode.c

ld -T linker.ld -o bin/kernel.bin obj/main.o obj/textmode.o

cp /home/rstat1/Desktop/current\ work/bin/kernel.bin /home/rstat1/fd0/boot/kernel.bin
cp /home/rstat1/Desktop/current\ work/bin/kernel.bin /home/rstat1/fd0/boot/kernel.bin

chown kernel bin/kernel.bin obj/kernel.o

echo "Kernel Image generated succesfully!"

#!/bin/bash

# Assemble the assembly code
nasm -f elf32 kernel.asm -o kasm.o

# Compile the C code
gcc -m32 -ffreestanding -c kernel.c -o kc.o

# Link the files using the linker script
ld -m elf_i386 -T link.ld -o ./ISO/boot/kernel.bin kasm.o kc.o



# Create a bootable ISO with GRUB
grub-mkrescue -o bootable.iso ./ISO
qemu-system-i386 -cdrom bootable.iso
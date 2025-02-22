#!/bin/bash

set -e  # Exit on error

# Directories
ISO_DIR="./ISO/boot"
BUILD_DIR="./build"

mkdir -p $ISO_DIR $BUILD_DIR

echo "[*] Assembling the assembly code..."
nasm -f elf32 kernel.asm -o $BUILD_DIR/kasm.o

echo "[*] Compiling the C code..."
gcc -m32 -ffreestanding -c kernel.c -o $BUILD_DIR/kc.o

echo "[*] Linking the object files..."
ld -m elf_i386 -T link.ld -o $ISO_DIR/kernel.bin $BUILD_DIR/kasm.o $BUILD_DIR/kc.o

echo "[*] Creating bootable ISO..."
grub-mkrescue -o bootable.iso ./ISO

echo "[*] Running in QEMU..."
qemu-system-i386 -cdrom bootable.iso

qemu-system-i386 -drive format=raw,file=./ISO/boot/kernel.bin
qemu-system-i386 -cdrom bootable.iso

nasm -f elf32 kernel.asm -o kasm.o
gcc -m32 -c kernel.c -o kc.o
ld -m elf_i386 -T link.ld -o ./ISO/boot/kernel.bin kasm.o kc.o
qemu-system-i386 -drive format=raw,file=./ISO/boot/kernel.bin
grub-mkrescue -o bootable.iso ./ISO

# Run with QEMU

qemu-system-i386 -drive format=raw,file=./ISO/boot/kernel.bin

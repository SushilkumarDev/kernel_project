
bits 32            ; Set the mode to 32-bit (important for x86 processors)
section .text      ; Define the section where the code will reside (text section)

align 4            ; Align the code on a 4-byte boundary (important for processors)

global _start      ; Define the global entry point for the linker
extern kmain       ; Declare an external reference to the kmain function (defined in kernel.c)

_start:
    cli             ; Clear interrupts (disable interrupts for setup)

    ; Prepare the stack and pass control to the C code (kmain function)
    call kmain      ; Jump to the kernel main function (defined in kernel.c)
    
    ; The CPU will continue execution from the kmain function, but we halt here
    hlt             ; Halt the CPU (pause execution)


; kernel.asm - A simple bootloader/kernel in Assembly for x86 architecture

[bits 32]              ; 32-bit mode
[global _start]        ; entry point for the linker

section .text
_start:
    ; Set video mode to text (0x03)
    mov ax, 0x03        ; 0x03 = 80x25 color text mode
    int 0x10            ; BIOS interrupt for video services

    ; Print "Hello, Kernel!" message
    mov edx, msg        ; Address of message string
    call print_string

    ; Halt the CPU (infinite loop)
    hlt

; Function to print a string to screen
print_string:
    mov ah, 0x0E        ; BIOS teletype function (TTY)
.next_char:
    lodsb               ; Load the next byte from string (AL = [ES:DI])
    or al, al           ; Check if we reached the end of string
    jz .done            ; If zero (null terminator), jump to done
    int 0x10            ; BIOS interrupt to print character in AL
    jmp .next_char      ; Loop through the next character
.done:
    ret                 ; Return from function

section .data
msg db 'Hello, Kernel!', 0  ; Null-terminated string

// kernel.c - Improved Version

#include "kernel.h"

void kmain(void) {
    clear_screen();
    print_string("Welcome to SushilOS!", 0, 0);
}

// Function to clear screen
void clear_screen() {
    char *vidmem = (char*) 0xB8000;
    for (int i = 0; i < 80 * 25 * 2; i += 2) {
        vidmem[i] = ' ';
        vidmem[i + 1] = 0x07;
    }
}

// Function to print a string at a specific location
void print_string(const char *str, int row, int col) {
    char *vidmem = (char*) 0xB8000;
    int offset = (row * 80 + col) * 2;
    
    for (int i = 0; str[i] != '\0'; i++) {
        vidmem[offset + i * 2] = str[i];
        vidmem[offset + i * 2 + 1] = 0x07;
    }
}

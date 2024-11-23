void kmain(void) {
    // Pointer to the video memory at address 0xB8000
    char* vidmem = (char*) 0xB8000;

    // Display 'A' at the first screen position
    vidmem[0] = 'A';     // Character to display
    vidmem[1] = 0x07;    // Attribute byte (0x07 is light gray on black background)
    
    // Now, you can continue with other kernel initialization code...
}

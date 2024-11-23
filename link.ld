ENTRY(_start)

SECTIONS {
    . = 1M;
    .multiboot_header : {
        *(.multiboot)
    }
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss)
    }
}

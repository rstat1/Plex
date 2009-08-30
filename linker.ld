OUTPUT_FORMAT("elf32-i386")
ENTRY (start)

SECTIONS{
    . = 0x00100000;

    .text :{
        KERNEL_START = .;

        *(.text)
    }

    .rodata ALIGN (0x1000) : {
        *(.rodata)
        _CTORS = .;
        *(.ctors)
        _CTORS_END = .;       
    }

    .data ALIGN (0x1000) : {
          start_ctors = .;
   	  *(.ctor*)
	  end_ctors = .;
	  start_dtors = .;
	  *(.dtor*)
	  end_dtors = .;
	  *(.data)
     }

    .bss : {
        SBSS = .;
        *(COMMON)
        *(.bss)
        EBSS = .;

        KERNEL_END = .;
    }
}

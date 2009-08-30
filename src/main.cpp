#include "includes/system.h"

int __gxx_personality_v0;
extern "C" void kernel_main(struct multiboot_info *mboot, int initial_stack);

void kernel_main(struct multiboot_info *mboot, int initial_stack)
{
    long int mem = 0;
    start_video();
    putstr("Init Descriptor Tables................."); 
    gdt_install(); 
    idt_install();
    putstr("[OK]\n"); 
    putstr("Init ISRs.............................."); 
    isr_install();    
    putstr("[OK]\n"); 
    putstr("Init IRQs.............................."); 
    irq_install(); 
    __asm__ __volatile__ ("sti");   
    putstr("[OK]\n"); 
    putstr("Init PIT..............................."); 
    timer_install();
    putstr("[OK]\n");    
    putstr("Memory.................................");
    mem = mboot->mem_upper / 1024; 
    putnum(mem);
    putstr("MB");
    putstr("\n\n");     
    putstr("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tWelcome to Plex!");
    for (;;); 
}

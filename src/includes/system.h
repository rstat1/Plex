#include "multiboot.h"


typedef int size_t;
typedef unsigned long uint32_t;
struct regs
{
    unsigned int gs, fs, es, ds;      /* pushed the segs last */
    unsigned int edi, esi, ebp, esp, ebx, edx, ecx, eax;  /* pushed by 'pusha' */
    unsigned int int_no, err_code;    /* our 'push byte #' and ecodes do this */
    unsigned int eip, cs, eflags, useresp, ss;   /* pushed by the processor automatically */ 
};

extern int end[];

//main.cpp
extern multiboot_info *mboot_info;
extern void *memcpy(void *dest, const void *src, int count);
extern void *memset(void *dest, unsigned char val, int count);
extern unsigned short *memsetw(unsigned short *dest, unsigned short val, int count);
extern unsigned char inportb(unsigned short _port);
extern void outportb(unsigned short _port, unsigned char _data);
extern size_t strlen(const char *text);

//textmode.cpp
extern void clear();
extern void putchar(const char c);
extern void putstr(const char *str);
extern void putnum(int n);
extern void setcolor(const char forecolor, unsigned char backcolor);
extern void start_video();

//Interrupts.cpp
extern void idt_set_gate(unsigned char num, unsigned long base, unsigned short sel, unsigned char flags);
extern void gdt_set_gate(int num, unsigned long base, unsigned long limit, unsigned char access, unsigned char gran);
extern void gdt_install();
extern void idt_install();
extern void isr_install();
extern void irq_install();
extern void irq_remap();;

//timer.cpp
extern void timer_handler();
extern void timer_install();

//mm.cpp
extern void init_memory_manager();

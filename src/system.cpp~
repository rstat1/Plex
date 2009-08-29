#include "includes/system.h"

extern void *memcpy(void *dest, const void *src, int count)
{
    const char *srcptr = (const char *)src;
    char *destptr = (char *)dest;
    for (int i = 0; i < count; i++)
    {
	*destptr++ = *srcptr++;
    }
    return dest;
}
extern unsigned short *memsetw(unsigned short *dest, unsigned short val, size_t count)
{
    unsigned short *temp = (unsigned short *)dest;    
    for(int i = 0; i < count; i++) 
    {
	*temp++ = val;
    }
    return dest;
}

extern void *memset(void *dest, unsigned char val, int count)
{
    unsigned char *temp = (unsigned char *)dest;
    for(int i = 0; i < count; i++) 
    {
	*temp++ = val;
    }
    return dest;
}
extern unsigned char inportb(unsigned short _port)
{
   unsigned char rv;
   __asm__ __volatile__ ("inb %1, %0" : "=a" (rv) : "dN" (_port));
   return rv;
}
extern void outportb(unsigned short _port, unsigned char _data)
{
    __asm__ __volatile__ ("outb %1, %0" : : "dN" (_port), "a" (_data));
}
extern size_t strlen(const char *text)
{
   size_t retval;
   for(retval = 0; *text != '\0'; text++) 
   {
	retval++;
   }
   return retval;
}

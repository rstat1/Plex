#include "includes/system.h"

void move_cursor();
void scroll();

unsigned short *textptr;
int attrib = 0x0F;
int csr_x = 0, csr_y = 0;

void start_video()
{
    textptr = (unsigned short *)0xB8000;
    clear();
}
void clear()
{
    unsigned blank_space = 0x20 | (attrib << 8);
    for (int i = 0; i < 25; i++)
    {
	memsetw(textptr + i * 80, blank_space, 80);
    }
    csr_x = 0; csr_y = 0;
    move_cursor(); 
}
void move_cursor()
{
   unsigned temp;
   temp = csr_y * 80 + csr_x;

   outportb(0x3D4, 14);
   outportb(0x3D5, temp >> 8);
   outportb(0x3D4, 15);
   outportb(0x3D5, temp);
}
void setcolor(const char forecolor, unsigned char backcolor)
{
   attrib = (backcolor << 4) | (forecolor & 0x0F);
}
void putchar(const char c)
{
   unsigned short *pos;
   if (c == '\n') 
   {
	csr_y++; 
        csr_x = 0;
   }
   if (c == '\t')
   {
        csr_x += 2;
   }
   if (c >= ' ')
   {
	pos = textptr + (csr_y * 80) + csr_x;
        *pos = c | attrib << 8;
        csr_x++;
   }
   move_cursor();
   scroll();
}
void putnum(int n)
{
    if (n == 0)
    {
        putchar('0');
        return;
    }
    if (n < 0)
    {
        putchar('-');
        n = -n;
    }
    unsigned int div = 1000000000;
    while (n / div == 0)
        div /= 10;
    while (div > 0)
    {
        char c = '0' + (n / div);
        putchar(c);
        n = n % div;
        div /= 10;
    }
}
void putstr(const char *str)
{
   for (int i = 0; i < strlen(str); i++)
   {
	putchar(str[i]);
   }
}
void scroll()
{
   unsigned blank_space = 0x20 | (attrib << 8);
   unsigned temp;
   if (csr_y >= 25)
   {
	temp = csr_y - 25 + 1;
	//memsetw(textptr + i * 80, blank_space, 80);	
        memcpy(textptr, textptr + temp * 80, (25 - temp) * 80 * 2);
        memsetw(textptr + (25 - temp) * 80, blank_space, 80);
        csr_y = 25 - 1;
   }
}

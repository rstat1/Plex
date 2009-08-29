#include "includes/system.h"
int timer_ticks = 0;
void InitPIT();
void timer_handler()
{
    /* Increment our 'tick count' */
    timer_ticks++;

    /* Every 18 clocks (approximately 1 second), we will
    *  display a message on the screen */
    if (timer_ticks % 18 == 0)
    {
        putstr("One second has passed\n");
    }
}

void InitPIT()
{
   /* Initialize the PIT with 1000 Hz (1 ms = 1 interval) as its frequency. */
   unsigned Divisor = (1193182L / 1000);

   /* Send a byte to the PIT command port (0x43) that IRQ0 should be repeated (0x36). */
   outportb(0x43, 0x36);

   /* Write the low and high byte respectively. */
   outportb(0x40, Divisor & 0xFF);
   outportb(0x40, (Divisor >> 8) & 0xFF);
}
void timer_install()
{
   InitPIT();
}

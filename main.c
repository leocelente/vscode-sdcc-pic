#pragma config XINST = OFF
#include <pic18fregs.h>

int main(void) {
  ADCON1 = 0x0F;
  TRISD = 0x00;
  PORTD = 0xFF;
  while (1)
    ;
}

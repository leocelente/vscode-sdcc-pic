#pragma config XINST = OFF
#include <pic18fregs.h>

int main(void) {
  TRISD = 0x00;
  ADCON1 = 0x0F;
  PORTD = 0xFF;
  while (1)
    ;
}

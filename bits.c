#include <stdio.h>

int main()
{
    int x = 0xFF;
    printf("%x\n", x);
    x &= ~(1 << 7);
    printf("%x\n", x);
    return 0;
}

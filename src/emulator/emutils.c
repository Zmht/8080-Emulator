#include <stdio.h>

void emulator_error(const char* file, const char* msg)
{
    printf("\033[1;31mError in file %s: %s", file, msg);
}

void opcode_error(unsigned char opcode)
{
    printf("\033[1;31m%02x is not implemented yet!", opcode);
}
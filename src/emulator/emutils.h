#ifndef _EMUTILS_H__
#define _EMUTILS_H__

void emulator_error(const char* file, const char* msg);
void opcode_error(unsigned char opcode);

#endif
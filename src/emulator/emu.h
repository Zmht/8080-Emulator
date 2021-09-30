#ifndef _EMU_H_
#define _EMU_H_

#include <stdint.h>

int emulate(char* romname, int verbose);

typedef struct
{
	uint8_t A;
	uint8_t F;

	uint8_t B;
	uint8_t C;

	uint8_t D;
	uint8_t E;

	uint8_t H;
	uint8_t L;

    unsigned char instruction;
    char* memory;

	uint16_t adress_bus;
	uint16_t data_bus;

	uint32_t stack_pointer;
	uint32_t program_counter;

} cpu_8080;

#endif

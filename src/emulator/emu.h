#ifndef _EMU_H_
#define _EMU_H_

#include <stdint.h>

typedef struct
{
	uint8_t A;

	uint8_t B;
	uint8_t C;

	uint8_t D;
	uint8_t E;

	uint8_t H;
	uint8_t L;

	unsigned int carry 		: 1;
	unsigned int aux_carry 	: 1;
	unsigned int sign 		: 1;
	unsigned int zero 		: 1;
	unsigned int parity		: 1;

    unsigned char instruction;
    char* memory;

	uint16_t adress_bus;
	uint16_t data_bus;

	uint32_t stack_pointer;
	uint32_t program_counter;

} cpu_8080;

int emulate_rom(char* romname, int verbose);
void emulate_instruction(char* inst);
void print_state(cpu_8080 *cpu);

#endif

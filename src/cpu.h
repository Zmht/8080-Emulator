/**
 * cpu.h
 * Description: State of the CPU and its properties
 * Author: Zachary Hansen Terry
 */

#include <stdint.h>

uint16_t program_counter;
uint16_t stack_pointer;

typedef struct
{
	unsigned int carry      : 1;
	unsigned int sign		: 1;
	unsigned int zero		: 1;
	unsigned int parity		: 1;
	unsigned int aux_carry	: 1;
} PSW_t;

typedef struct
{
	PSW_t A;
	uint8_t B;
	uint8_t C;
	uint8_t D;
	uint8_t E;
	uint8_t H;
	uint8_t L;
}registers_t;
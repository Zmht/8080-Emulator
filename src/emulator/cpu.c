/************************************************************************
 * File: cpu.c                                                          *
 * Author: Zachary Hansen Terry                                         *
 * Description: Emulates the basic state and functionality of the       *
 * Intel 8080 CPU                                                       *
 ***********************************************************************/

#include "cpu.h"
#include "emu.h"
#include "emutils.h"

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define ROM_START 0
#define ROM_END 0x1fff

void wrtie_memory_byte(cpu_8080 *cpu, uint16_t off, uint8_t val)
{
	if(off >= ROM_START && off <= ROM_END)
	{
		printf("Error, tried to write to read only section of memory (ROM) at adress 0x%x", ROM_START + off);
		exit(EXIT_FAILURE);
	}
	cpu->memory[off] = val;
}


int init_cpu(cpu_8080* cpu)
{
	cpu->program_counter = 0x00;    //Code execution starts at memory location 0x00
	if(cpu->program_counter == 0x00)
		return EXIT_SUCCESS;
	else
	{
		printf("CPU Init Error\n");
		return EXIT_FAILURE;
	}
}

int exec_instruction(cpu_8080* cpu)
{
	int opbytes = 0;

	switch(cpu->instruction)
	{
		case 0x00:		//NOP
			printf("NOP\n");
			opbytes = 1;
			break;
		case 0x01:		//LXI B register pair
			opbytes = 3;
			cpu->B = cpu->memory[cpu->program_counter + 1];
			cpu->C = cpu->memory[cpu->program_counter + 2];
			break;
		case 0x02:		// STAX B
			opbytes = 1;
			

			



		default:
			opcode_error(cpu->instruction);
			exit(EXIT_FAILURE);	
	}
	
	return opbytes;
}


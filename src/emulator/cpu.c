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
		case 0x02:		// STAX
			opbytes = 1;
			
			



		default:
			opcode_error(cpu->instruction);
			exit(EXIT_FAILURE);	
	}
	
	return opbytes;
}


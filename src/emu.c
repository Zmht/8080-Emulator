/************************************************************************
 * File: emu.c                                                           *
 * Author: Zachary Hansen Terry                                          *
 * Description: Emulates the whole machine and ties individual           *
 * components together.                                                  *
 ************************************************************************/

#include "emu.h"
#include "emutils.h"
#include "cpu.h"

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

void print_state(cpu_8080 *cpu)
{
	printf("\
	INS: %X\n\
	B: %X, C: %X\n\
	D: %X, E: %X\n\
	H: %X, L: %X\n\
	A: %X, PC: %X, SP: %X\n\
	carry: %d, aux: %d, parity: %d, sign: %d, zero: %d\n",\
	cpu->instruction, \
	cpu->B, cpu->C, \
	cpu->D, cpu->E, \
	cpu->H, cpu->L, \
	cpu->A, cpu->program_counter, cpu->stack_pointer, \
	cpu->carry, cpu->aux_carry, cpu-> parity, cpu->sign, cpu->zero);
}

void emulate_instruction(char* ins, cpu_8080 *cpu)
{
	cpu->memory = ins;
	//init_cpu(cpu);
	cpu->program_counter = 0;
	cpu->instruction = cpu->memory[cpu->program_counter];
	exec_instruction(cpu);

	print_state(cpu);
}

int emulate_rom(char* romname, int verbose)
{
    cpu_8080 cpu;

    FILE* romfile = NULL;
    romfile = fopen(romname, "rb");
    if(romfile == NULL)
    {
        emulator_error("emu.c", "could not open romfile");
        exit(EXIT_FAILURE);
    }

    fseek(romfile, 0, SEEK_END);
    long fsize = ftell(romfile);
    fseek(romfile, 0, SEEK_SET);
    
    cpu.memory = malloc(fsize + 1);
    fread(cpu.memory, 1, fsize, romfile);
    fclose(romfile);
    cpu.memory[fsize] = '\0';

    init_cpu(&cpu);

    for (int i = 0; i < fsize; i+= 1)			
	{
        cpu.program_counter = i;
        cpu.instruction = cpu.memory[i];
		switch (exec_instruction(&cpu))
		{
			case 1:
				i+=0;
				break;
			case 2:
				i+=1;
				break;
			case 3:
				i+=2;
				break;
		}
	}
    


    free(cpu.memory);
    return 0;

    //exec_instruction(romfile);
}

int init_cpu(cpu_8080* cpu)
{
	cpu->program_counter = 0x00;    //Code execution starts at memory location 0x00
	cpu->A = 0;

	cpu->B = 0;
	cpu->C = 0;

	cpu->D = 0;
	cpu->E = 0;

	cpu->H = 0;
	cpu->L = 0;

	cpu->carry		= 0;
	cpu->aux_carry 	= 0;
	cpu->sign 		= 0;
	cpu->zero 		= 0;
	cpu->parity		= 0;

	return 0;
}

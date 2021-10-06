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



void emulate_instruction(char* ins)
{
	cpu_8080 cpu;
	cpu.memory = ins;
	init_cpu(&cpu);
	for(int i = 0; i < sizeof(ins); i++)
	{
		cpu.program_counter = i;
		cpu.instruction = cpu.memory[i];
		exec_instruction(&cpu);
	}
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

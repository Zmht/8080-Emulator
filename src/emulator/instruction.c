#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "emu.h"



void ins_prompt()
{
	printf("Ins: ");
}

void process_ins()
{
	unsigned int ins[3];
	
	scanf("%x%x", &ins[0], &ins[1]);

	char ins_c[3];

	for (int i = 0; i < 3; i++)
	{
		ins_c[i] = ins[i];

	}

	static cpu_8080 cpu;
	static int init = 0;
	if (init == 0)
	{
		init_cpu(&cpu);
		init = 1;
	}


	emulate_instruction(ins_c, &cpu);	
}

void ins_shell()
{
	while(1==1)
	{
		ins_prompt();
		process_ins();
	}
		
}


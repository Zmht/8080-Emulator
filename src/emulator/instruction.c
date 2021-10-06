#include <stdio.h>
#include <stdint.h>
#include "emu.h"

void ins_prompt()
{
	printf("Ins: ");
}

void process_ins()
{
	unsigned int ins[3];
	scanf("%x", ins);

	char ins_c[3];

	for (int i = 0; i < 3; i++)
	{
		ins_c[i] = ins[i];

	}	
	emulate_instruction(ins_c);	
}

void ins_shell()
{
	while(1==1)
	{
		ins_prompt();
		process_ins();
	}
		
}


#include <stdio.h>
#include <stdint.h>
#include "emu.h"

void ins_prompt()
{
	printf("\033[1;32m[zemulator]\033[0;0m ");
}

void process_ins()
{
	unsigned char ins[3];
	scanf("%c", &ins[0]);
	emulate_instruction(ins);	
}

void ins_shell()
{
	while(1==1)
	{
		ins_prompt();
		process_ins();
	}
		
}


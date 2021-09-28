/************************************************************************
 * File: shell.c                                                        *
 * Author: Zachary Hansen Terry                                         *
 * Description: The emulator shell is how you acces all funcionality of *
 * the computer.                                                        *
 ***********************************************************************/

#include "shell.h"
#include "emutils.h"
#include "disassembler.h"
#include "emu.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_COMMAND_SIZE 15
#define MAX_ARG_SIZE 100

void prompt();
void legal_commands();
int process();


char ROM[MAX_ARG_SIZE + 1] = "nothing";
char OUT[MAX_ARG_SIZE + 1] = "stdout";

int shell()
{
	while (1 == 1)
	{
		prompt();

		if(process() == -1)
		{
			legal_commands();
		}
	}

	return 0;
}

void prompt()
{
	printf("\033[1;32m[zemulator]\033[0;0m ");
}

int process()
{
	char command[MAX_COMMAND_SIZE];
	char arg[MAX_ARG_SIZE + 1];
	scanf("%s", command);
	if (strcmp(command, "romload") == 0 || strcmp(command, "setout") == 0)
	{
	fseek(stdin, MAX_COMMAND_SIZE, SEEK_SET);
	fscanf(stdin, "%s", arg);    
	}
	

	if(strcmp(command, "clear") == 0)
	{
		system("clear"); //TODO: Make this non system dependent?
		return 0;
	}

	if(strcmp(command, "help") == 0)
	{
		return -1;
	}

	if(strcmp(command, "romload") == 0)
	{
		strncpy(ROM, arg, MAX_ARG_SIZE);
		ROM[MAX_ARG_SIZE] = '\0';
		return 0;
	}

	if(strcmp(command, "setout") == 0)
	{
		strncpy(OUT, arg, MAX_ARG_SIZE);
		OUT[MAX_ARG_SIZE] = '\0';
		return 0;
	}

	if(strcmp(command, "list") == 0)
	{
		printf("%s is currently loaded\n", ROM);
		return 0;
	}

	if(strcmp(command, "emulate") == 0)
	{
		emulate("roms/invaders/invaders.rom", 1);
		return 0;
	}

	if(strcmp(command, "inst") == 0)
	{
		printf("This is the individual instruction commmand.\n");
		return 0;
	}

	if(strcmp(command, "disassemble") == 0)
	{
		disassemble(ROM, OUT);
		return 0;
	}

	if(strcmp(command, "assemble") == 0)
	{
		printf("Assemble time???\n");
		return 0;
	}

	if(strcmp(command, "quit") == 0 || strcmp(command, "exit") == 0)
	{
		exit(EXIT_SUCCESS);
	}

	return -1;
}

void legal_commands()
{
	printf("LEGAL COMMANDS:\n\
	\tclear - clear the shell\n\
	\tquit - exit program\n\
	\thelp - bring up this menu\n\
	\tromload <file> - load specified file into program\n\
	\tsetout <file> - set the output file (standard is stdout)\n\
	\tlist - lists loaded file\n\
	\temulate - emulate loaded file\n\
	\tinst - emulate single instructions\n\
	\tdisassemble - disassemble loaded file\n\
	\tassemble - assembles a given 8080 assembly file\n");
}


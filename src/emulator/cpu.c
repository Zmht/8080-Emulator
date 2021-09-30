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

uint16_t make_word(uint8_t *l, uint8_t *r);
void wrtie_memory_byte(cpu_8080 *cpu, uint16_t off, uint8_t val);
uint8_t read_memory_byte(cpu_8080* cpu, uint16_t off);
void add_reg_pair(uint8_t *l, uint8_t *r, uint8_t val);



void wrtie_memory_byte(cpu_8080 *cpu, uint16_t off, uint8_t val)
{
	if(off >= ROM_START && off <= ROM_END)
	{
		printf("Error, tried to write to read only section of memory (ROM) at adress 0x%x", ROM_START + off);
		exit(EXIT_FAILURE);
	}
	cpu->memory[off] = val;
}

uint8_t read_memory_byte(cpu_8080* cpu, uint16_t off)
{
	uint8_t byte = cpu->memory[off];
	return byte;
}

void add_reg_pair(uint8_t *l, uint8_t *r, uint8_t val)
{
	uint16_t num = make_word(l, r);
	uint32_t sum = num + val;
    
    *l = sum >> 8;
	*r = sum & 0xFF; 
}

uint16_t make_word(uint8_t *l, uint8_t *r)
{
	uint16_t word = *l << 8;
	word = word | *r;
	return word;
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
			opbytes = 1;
			break;
		case 0x01:		// LXI B,d16. Loads the third byte of ins into first reg, 2nd byte into 2nd reg (endianness)
			opbytes = 3;
			cpu->B = read_memory_byte(cpu, cpu->program_counter + 2);
			cpu->C = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x02:		// STAX B. Takes the contents of the accumulator (A reg) and puts them at the location in B reg pair
			opbytes = 1;
			wrtie_memory_byte(cpu, make_word(&cpu->B, &cpu->C), cpu->A);
			break;
		case 0x03:		// INX B. Incriments the number in the B reg pair
			opbytes = 1;
			add_reg_pair(&cpu->B, &cpu->C, 1);
			break;	
		case 0x04:		// INR B. register is incremented by one
			opbytes = 1;
			cpu->B = ++cpu->B;
			break;
		case 0x08:		// NOP alt
			opbytes = 1;
			break;
		case 0x0A:	 	// LDAX B. Contents of mem adress stored in B reg pair go into the accuulator
			opbytes = 1;
            cpu->A = read_memory_byte(cpu, make_word(&cpu->B, &cpu->C));
			break;
		case 0x0C:		// INR C. register is incremented by one
			opbytes = 1;
			cpu->C = ++cpu->C;
			break;
		case 0x10:		// NOP alt
			opbytes = 1;
			break;
		case 0x11:		// LXI D,d16. Loads the third byte of ins into first reg, 2nd byte into 2nd reg (endianness)
			opbytes = 3;
			cpu->D = read_memory_byte(cpu, cpu->program_counter + 2);
			cpu->E = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x12:		//STAX D. Takes the contents of the accumulator (A reg) and puts them at the location in D reg pair
			opbytes = 1;
			wrtie_memory_byte(cpu, make_word(&cpu->D, &cpu->E), cpu->A);
			break;
		case 0x13:		// INX D. Increments the number in the D reg pair
			opbytes = 1;
			add_reg_pair(&cpu->D, &cpu->E, 1);
			break;
		case 0x14:		// INR D. register is incremented by one
			opbytes = 1;
			cpu->D = ++cpu->D;
			break;
		case 0x18:		//NOP alt
			opbytes = 1;
			break;
		case 0x1A:		// LDAX D. Contents of mem addr stored in D reg pair got to accmumulator (A reg)
			opbytes = 1;
			cpu->A = read_memory_byte(cpu, make_word(&cpu->B, &cpu->C));
			break;
		case 0x1C:		// INR E. register is incremented by one
			opbytes = 1;
			cpu->E = ++cpu->E;
			break;
		case 0x20:		// NOP alt
			opbytes = 1;
			break;
		case 0x21:		// LXI H,d16. Loads the third byte of ins into first reg, 2nd byte into 2nd reg (endianness)
			opbytes = 3;
			cpu->H = read_memory_byte(cpu, cpu->program_counter + 2);
			cpu->L = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x23:		// INX H. Increments the number in the H reg pair
			opbytes = 1;
			add_reg_pair(&cpu->H, &cpu->L, 1);
			break;
		case 0x24:		// INR H. register is incremented by one
			opbytes = 1;
			cpu->H = ++cpu->H;
			break;
		case 0x28:		// NOP alt
			opbytes =1;
			break;
		case 0x2C:		// INR L. register is incremented by one
			opbytes = 1;
			cpu->L = ++cpu->L;
			break;
		case 0x30:		// NOP alt
			opbytes = 1;
			break;
		case 0x31:		// LXI SP,d16. Loads the stack pointer with the bytes after the instruction
			opbytes = 3;
			cpu->stack_pointer = make_word(read_memory_byte(cpu, cpu->program_counter + 2), read_memory_byte(cpu, cpu->program_counter + 1));
			break;
		case 0x33:		// INX SP. Increments the stack pointer
			opbytes = 1;
			cpu->stack_pointer = cpu->stack_pointer + 1;
			break;
		case 0x38:		// NOP alt
			opbytes =1;
			break;
		case 0x3C:		// INR A. accumulator is incremented by one
			opbytes = 1;
			cpu->A = ++cpu->C;
			break;
			

			



		default:
			opcode_error(cpu->instruction);
			exit(EXIT_FAILURE);	
	}
	
	return opbytes;
}


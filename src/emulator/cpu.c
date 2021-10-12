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

#define BIT_CHECK(a, b) ((a >> (b - 1)) & 1U)
#define BIT_SET(a, b) (a | (1UL << (b - 1)))
#define BIT_CLEAR(a, b) (a & ~(1UL << (b - 1)))

#define ROM_START 0
#define ROM_END 0x1fff

uint16_t make_word(uint8_t l, uint8_t r);
void write_memory_byte(cpu_8080 *cpu, uint16_t off, uint8_t val);
uint8_t read_memory_byte(cpu_8080* cpu, uint16_t off);
void add_to_reg_pair(uint8_t *l, uint8_t *r, uint8_t val);



void check_aux_cary(cpu_8080* cpu, uint16_t* sum, uint8_t* addend1, uint8_t* addend2)
{
	if((BIT_CHECK(*addend1, 4) + BIT_CHECK(*addend2, 4)) != BIT_CHECK(*sum, 4))
	{
		cpu->aux_carry = 1;
	}
	else
		cpu->aux_carry = 0;
}
void write_memory_byte(cpu_8080 *cpu, uint16_t off, uint8_t val)
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

void sub_from_reg_pair(uint8_t *l, uint8_t *r, uint8_t val)
{
	uint16_t pair = make_word(*l, *r);
	uint32_t diff = pair - val;
	*l = diff >> 8;
	*r = diff & 0xFF;
}

void add_to_reg_pair(uint8_t *l, uint8_t *r, uint8_t val)
{
	uint16_t num = make_word(*l, *r);
	uint32_t sum = num + val;
    
    *l = sum >> 8;
	*r = sum & 0xFF; 
}

void add_to_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t sum = *reg + val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = BIT_CHECK(sum, 8);

	int one_bits = 0;
	for (int i = 0; i < 8; i++)
	{
		if(((sum & 0xFF) & (1 << i)) == (1 << i))
			one_bits += 1;
	}

	check_aux_cary(cpu, &sum, reg, &val);

	if((one_bits % 2) == 1)
	{
		cpu->parity = 0;
	}
	else if((one_bits & 2) == 0)
	{
		cpu->parity = 1;
	}

	if((sum & 0xFF) == 0)
	{
		cpu->zero = 1;
	}

	*reg = (sum & 0xFF);
}

void sub_from_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t ans = *reg - val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = (ans & 0x80);
	check_aux_cary(cpu, &ans, reg, &val);

	int one_bits = 0;
	for (int i = 0; i < 8; i++)
	{
		if(((ans & 0xFF) & (1 << i)) == (1 << i))
			one_bits += 1;
	}
	if((one_bits % 2) == 1)
	{
		cpu->parity = 0;
	}
	else
		cpu->parity = 1;

	if((ans & 0xFF) == 0)
	{
		cpu->zero = 1;
	}

	*reg = (ans & 0xFF);

}

uint8_t add_numbers(cpu_8080* cpu, uint8_t number, uint8_t val)
{
	uint16_t sum = number + val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = (sum & 0x80);
	check_aux_cary(cpu, &sum, &number, &val);

	int one_bits = 0;
	for (int i = 0; i < 8; i++)
	{
		if(((sum & 0xFF) & (1 << i)) == (1 << i))
			one_bits += 1;
	}
	if((one_bits % 2) == 1)
	{
		cpu->parity = 0;
	}
	else
		cpu->parity = 1;

	if((sum & 0xFF) == 0)
	{
		cpu->zero = 1;
	}

	return (sum & 0xFF);
}

uint8_t sub_numbers(cpu_8080* cpu, uint8_t number, uint8_t val)
{
	uint16_t ans = number - val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = (ans & 0x80);
	check_aux_cary(cpu, &ans, &number, &val);

	int one_bits = 0;
	for (int i = 0; i < 8; i++)
	{
		if(((ans & 0xFF) & (1 << i)) == (1 << i))
			one_bits += 1;
	}
	if((one_bits % 2) == 1)
	{
		cpu->parity = 0;
	}
	else
		cpu->parity = 1;

	if((ans & 0xFF) == 0)
	{
		cpu->zero = 1;
	}

	return (ans & 0xFF);
}

uint16_t make_word(uint8_t l, uint8_t r)
{
	uint16_t word = l << 8;
	word = word | r;
	return word;
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
			write_memory_byte(cpu, make_word(cpu->B, cpu->C), cpu->A);
			break;
		case 0x03:		// INX B. Incriments the number in the B reg pair
			opbytes = 1;
			add_to_reg_pair(&cpu->B, &cpu->C, 1);
			break;	
		case 0x04:		// INR B. register is incremented by one
			opbytes = 1;
			add_to_reg(cpu, &cpu->B, 1);
			break;
		case 0x05:		// DCR B. register is decremented by one
			opbytes = 1;
			sub_from_reg(cpu, &cpu->B, 1);
			break;
		case 0x07:		// RLC. Rotates the contents of the accumulator
			cpu->carry = (cpu->A >> 7) & 1;
			cpu->A = cpu-> A << 1;
			cpu->A |= cpu->carry << 0;
		case 0x08:		// NOP alt
			opbytes = 1;
			break;
		case 0x09:		// DAD B
			opbytes = 1;
			uint32_t ans = make_word(cpu->B, cpu->C) + make_word(cpu->H, cpu->L);
			if(BIT_CHECK(ans, 9) == 1)
				cpu->carry = 1;
			else
				cpu->carry = 0;
			cpu->H = ans >> 8;
			cpu->L = ans & 0xFF;
			break;
		case 0x0A:	 	// LDAX B. Contents of mem adress stored in B reg pair go into the accuulator
			opbytes = 1;
            cpu->A = read_memory_byte(cpu, make_word(cpu->B, cpu->C));
			break;
		case 0x0B:		// DCX B. decrements the value in the specified register pair
			opbytes = 1;
			sub_from_reg_pair(&cpu->B, &cpu->C, 1);
			break;
		case 0x0C:		// INR C. register is incremented by one
			opbytes = 1;
			add_to_reg(cpu, &cpu->C, 1);
			break;
		case 0x0D:		// DCR C. register is decremented by one
			opbytes = 1;
			sub_from_reg(cpu, &cpu->C, 1);
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
			write_memory_byte(cpu, make_word(cpu->D, cpu->E), cpu->A);
			break;
		case 0x13:		// INX D. Increments the number in the D reg pair
			opbytes = 1;
			add_to_reg_pair(&cpu->D, &cpu->E, 1);
			break;
		case 0x14:		// INR D. register is incremented by one
			opbytes = 1;
			add_to_reg(cpu, &cpu->D, 1);
			break;
		case 0x15:		// DCR D. register is decremented by one
			opbytes = 1;
			sub_from_reg(cpu, &cpu->D, 1);
			break;
		case 0x17:		// RAL. Rotates the accumulator left 
			opbytes = 1;
			int prev_carry = cpu->carry;
			cpu->carry = (BIT_CHECK(cpu->A, 8));
			cpu->A = cpu->A << 1;
			if(prev_carry == 1)
				cpu->A = BIT_SET(cpu->A, 1);
			if(prev_carry == 0)
				cpu->A = BIT_CLEAR(cpu->A, 1);
			break;
		case 0x18:		//NOP alt
			opbytes = 1;
			break;
		case 0x19:		// DAD D. Adds register pair to HL and stores it in HL
			opbytes = 1;
			uint32_t ans = make_word(cpu->D, cpu->E) + make_word(cpu->H, cpu->L);
			if(BIT_CHECK(ans, 9) == 1)
				cpu->carry = 1;
			else
				cpu->carry = 0;
			cpu->H = ans >> 8;
			cpu->L = ans & 0xFF;
			break;
		case 0x1A:		// LDAX D. Contents of mem addr stored in D reg pair got to accmumulator (A reg)
			opbytes = 1;
			cpu->A = read_memory_byte(cpu, make_word(cpu->B, cpu->C));
			break;
		case 0x1B:		// DCX D. decrements the value in the specified register pair
			opbytes = 1;
			sub_from_reg_pair(&cpu->D, &cpu->E, 1);
			break;
		case 0x1C:		// INR E. register is incremented by one
			opbytes = 1;
			add_to_reg(cpu, &cpu->E, 1);
			break;
		case 0x1D:		// DCR E. register is decremented by one
			opbytes = 1;
			sub_from_reg(cpu, &cpu->E, 1);
			break;
		case 0x20:		// NOP alt
			opbytes = 1;
			break;
		case 0x21:		// LXI H,d16. Loads the third byte of ins into first reg, 2nd byte into 2nd reg (endianness)
			opbytes = 3;
			cpu->H = read_memory_byte(cpu, cpu->program_counter + 2);
			cpu->L = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x22:		// SHLD d16 (store HL direct) L register goes into the mem address in 3rd and 2nd bytes. H reg goes into the next higher address.
			opbytes = 3;
			write_memory_byte(cpu, make_word(cpu->program_counter + 2, cpu->program_counter + 1), cpu->L);
			write_memory_byte(cpu, (make_word(cpu->program_counter + 2, cpu->program_counter + 1) + 1), cpu->H);
			break;
		case 0x23:		// INX H. Increments the number in the H reg pair
			opbytes = 1;
			add_to_reg_pair(&cpu->H, &cpu->L, 1);
			break;
		case 0x24:		// INR H. register is incremented by one
			opbytes = 1;
			add_to_reg(cpu, &cpu->H, 1);
			break;
		case 0x25:		// DCR H. register is decremented by one
			opbytes = 1;
			sub_from_reg(cpu, &cpu->H, 1);
			break;
		case 0x28:		// NOP alt
			opbytes = 1;
			break;
		case 0x29:		// DAD H. doubles H reg pair
			opbytes = 1;
			uint32_t ans = make_word(cpu->H, cpu->L) * 2;
			if(BIT_CHECK(ans, 9) == 1)
				cpu->carry = 1;
			else
				cpu->carry = 0;
			cpu->H = ans >> 8;
			cpu->L = ans & 0xFF;
			break;
		case 0x2B:		// DCX H. decrements the value in the specified register pair
			opbytes = 1;
			sub_from_reg_pair(&cpu->H, &cpu->L, 1);
			break;
		case 0x2C:		// INR L. register is incremented by one
			opbytes = 1;
			add_to_reg(cpu, &cpu->L, 1);
			break;
		case 0x2D:		// DCR L. register is decremented by one
			opbytes = 1;
			sub_from_reg(cpu, &cpu->L, 1);
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
		case 0x34:		// INR M. memory at HL is incremented by one
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), add_numbers(cpu, read_memory_byte(cpu, make_word(cpu->H, cpu->L)), 1));
			break;
		case 0x35:		// DCR M. memory at HL is decremented by one
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), sub_numbers(cpu, read_memory_byte(cpu, make_word(cpu->H, cpu->L)), 1));
			break;
		case 0x38:		// NOP alt
			opbytes =1;
			break;
		case 0x39:		// DAD SP. adds the SP to H reg pair
			opbytes = 1;
			uint32_t ans = cpu->stack_pointer + make_word(cpu->H, cpu->L);
			if(BIT_CHECK(ans, 9) == 1)
				cpu->carry = 1;
			else
				cpu->carry = 0;
			cpu->H = ans >> 8;
			cpu->L = ans & 0xFF;
			break;
		case 0x3B:		// DCX SP. decrements the stack pointer
			opbytes = 1;
			cpu->stack_pointer -=1;
			break;
		case 0x3C:		// INR A. accumulator is incremented by one
			opbytes = 1;
			add_to_reg(cpu, &cpu->A, 1);
			break;
		case 0x3D:		// DCR A. accumulator is decremented by one
			opbytes = 1;
			sub_from_reg(cpu, &cpu->A, 1);
			break;
		default:
			opcode_error(cpu->instruction);
			break;
			//exit(EXIT_FAILURE);	
	}
	
	return opbytes;
}


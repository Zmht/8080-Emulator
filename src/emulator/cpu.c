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

void mov(uint8_t *src, uint8_t *dst)
{
	*dst = *src;
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

void carry_add_to_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t sum = *reg + val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = BIT_CHECK(sum, 8);
	cpu->carry = BIT_CHECK(sum, 9);

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

void carry_xor_to_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t sum = *reg ^ val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = BIT_CHECK(sum, 8);
	cpu->carry = BIT_CHECK(sum, 9);

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

void carry_or_to_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t sum = *reg | val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = BIT_CHECK(sum, 8);
	cpu->carry = BIT_CHECK(sum, 9);

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

void carry_cmp_to_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t sum = *reg - val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = BIT_CHECK(sum, 8);
	cpu->carry = BIT_CHECK(sum, 9);

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
}

void carry_and_to_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t sum = *reg & val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = BIT_CHECK(sum, 8);
	cpu->carry = BIT_CHECK(sum, 9);

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

void carry_sub_from_reg(cpu_8080* cpu, uint8_t *reg, uint8_t val)
{
	uint16_t ans = *reg - val;
	//sign, aux, parity, zero
	cpu->zero = 0;	// reseting the zero bit to false
	cpu->sign = (ans & 0x80);
	cpu->carry = BIT_CHECK(ans, 9);
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
	uint32_t ans;

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
		case 0x06:		// MVI B,d8. Loads specified register with immediate data.
			opbytes = 2;
			cpu->B = read_memory_byte(cpu, cpu->program_counter + 1);
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
			ans = make_word(cpu->B, cpu->C) + make_word(cpu->H, cpu->L);
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
		case 0x0E:		// MVI C,d8. Loads specified register with immediate data.
			opbytes = 2;
			cpu->C = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x0F:		// RRC. Rotate acc right
			opbytes = 1;
			cpu->carry = BIT_CHECK(cpu->A, 1);
			cpu->A = cpu->A >> 1;
			BIT_SET(cpu->A, 8);
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
		case 0x16:		// MVI D,d8. Loads specified register with immediate data.
			opbytes = 2;
			cpu->D = read_memory_byte(cpu, cpu->program_counter + 1);
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
			ans = make_word(cpu->D, cpu->E) + make_word(cpu->H, cpu->L);
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
		case 0x1E:		// MVI E,d8. Loads specified register with immediate data.
			opbytes = 2;
			cpu->E = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x1f:		// RAR rotate right thruogh carry
			prev_carry = cpu->carry;
			opbytes = 1;
			cpu->carry = BIT_CHECK(cpu->A, 1);
			cpu->A = cpu->A >> 1;
			BIT_SET(cpu->A, 8);
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
		case 0x26:		// MVI H,d8. Loads specified register with immediate data.
			opbytes = 2;
			cpu->H = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x27: 		// DAA. 
			opbytes = 1;
			if((cpu->A & 0xF) > 9 || cpu->aux_carry == 1)
				cpu->A += 6;
			//check_aux_cary(cpu, cpu->A, 6, cpu->A - 6);
			if((cpu->A >> 4) > 9 || cpu->carry == 1)
				cpu->A = cpu->A & (((cpu->A >> 4) + 6) << 4);
			break;
		case 0x28:		// NOP alt
			opbytes = 1;
			break;
		case 0x29:		// DAD H. doubles H reg pair
			opbytes = 1;
			ans = make_word(cpu->H, cpu->L) * 2;
			if(BIT_CHECK(ans, 9) == 1)
				cpu->carry = 1;
			else
				cpu->carry = 0;
			cpu->H = ans >> 8;
			cpu->L = ans & 0xFF;
			break;
		case 0x2A:		// LHLD a16
			opbytes = 1;
			cpu->L = read_memory_byte(cpu, make_word(cpu->memory[cpu->program_counter + 1], cpu->memory[cpu->program_counter + 2]));
			cpu->H = read_memory_byte(cpu, make_word(cpu->memory[cpu->program_counter + 3], cpu->memory[cpu->program_counter + 4]));
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
		case 0x2E:		// MVI L,d8. Loads specified register with immediate data.
			opbytes = 2;
			cpu->L = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x2F:		// CMA. Complement accu
			opbytes =1;
			cpu->A = ~cpu->A;
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
		case 0x36:		// MVI M,d8. Loads specified register with immediate data.
			opbytes = 2;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), read_memory_byte(cpu, cpu->program_counter + 1));
			break;
		case 0x37: 		//STC sets teh carry bit
			opbytes = 1;
			cpu->carry = 1;
			break;
		case 0x38:		// NOP alt
			opbytes =1;
			break;
		case 0x39:		// DAD SP. adds the SP to H reg pair
			opbytes = 1;
			ans = cpu->stack_pointer + make_word(cpu->H, cpu->L);
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
		case 0x3E:		// MVI A,d8. Loads specified register with immediate data.
			opbytes = 2;
			cpu->A = read_memory_byte(cpu, cpu->program_counter + 1);
			break;
		case 0x3f:		// CMC. complement accumulator
			opbytes =1;
			if(cpu->carry == 1)
				cpu->carry = 0;
			else
				cpu->carry =1;

			break;
		
		case 0x40: //MOV B,B. 
			opbytes =1;
			//NOP
			break;
		case 0x41:
			opbytes = 1;
			cpu->B = cpu->C;
			break;
		case 0x42:
			opbytes = 1;
			cpu->B = cpu->D;
			break;
		case 0x43:
			opbytes = 1;
			cpu->B = cpu->E;
			break;
		case 0x44:
			opbytes = 1;
			cpu->B = cpu->H;
			break;
		case 0x45:
			opbytes = 1;
			cpu->B = cpu->L;
			break;
		case 0x46:
			opbytes = 1;
			cpu->B = read_memory_byte(cpu, make_word(cpu->H, cpu->L));
			break;
		case 0x47:
			opbytes = 1;
			cpu->B = cpu->A;
			break;
		case 0x48:
			opbytes = 1;
			cpu->C = cpu->B;
			break;
		case 0x49:
			opbytes = 1;
			cpu->C = cpu->C;
			break;
		case 0x4A:
			opbytes = 1;
			cpu->C = cpu->D;
			break;
		case 0x4B:
			opbytes = 1;
			cpu->C = cpu->E;
			break;
		case 0x4C:
			opbytes = 1;
			cpu->B = cpu->H;
			break;
		case 0x4D:
			opbytes = 1;
			cpu->B = cpu->L;
			break;
		case 0x4E:
			opbytes = 1;
			cpu->B = read_memory_byte(cpu, make_word(cpu->H, cpu->L));
			break;
		case 0x4F:
			opbytes = 1;
			cpu->B = cpu->A;
			break;
		case 0x50:
			opbytes = 1;
			cpu->D = cpu->B;
			break;
		case 0x51:
			opbytes = 1;
			cpu->D = cpu->C;
			break;
		case 0x52:
			opbytes = 1;
			cpu->D = cpu->D;
			break;
		case 0x53:
			opbytes = 1;
			cpu->D = cpu->E;
			break;
		case 0x54:
			opbytes = 1;
			cpu->D = cpu->H;
			break;
		case 0x55:
			opbytes = 1;
			cpu->D = cpu->L;
			break;
		case 0x56:
			opbytes = 1;
			cpu->D = read_memory_byte(cpu, make_word(cpu->H, cpu->L));
			break;
		case 0x57:
			opbytes = 1;
			cpu->D = cpu->A;
			break;
		case 0x58:
			opbytes = 1;
			cpu->E = cpu->B;
			break;
		case 0x59:
			opbytes = 1;
			cpu->E = cpu->C;
			break;
		case 0x5A:
			opbytes = 1;
			cpu->E = cpu->D;
			break;
		case 0x5B:
			opbytes = 1;
			cpu->E = cpu->E;
			break;
		case 0x5C:
			opbytes = 1;
			cpu->E = cpu->H;
			break;
		case 0x5D:
			opbytes = 1;
			cpu->E = cpu->L;
			break;
		case 0x5E:
			opbytes = 1;
			cpu->E = read_memory_byte(cpu, make_word(cpu->H, cpu->L));
			break;
		case 0x5F:
			opbytes = 1;
			cpu->E = cpu->A;
			break;
		case 0x60:
			opbytes = 1;
			cpu->H = cpu->B;
			break;
		case 0x61:
			opbytes = 1;
			cpu->H = cpu->C;
			break;
		case 0x62:
			opbytes = 1;
			cpu->H = cpu->D;
			break;
		case 0x63:
			opbytes = 1;
			cpu->H = cpu->E;
			break;
		case 0x64:
			opbytes = 1;
			cpu->H = cpu->H;
			break;
		case 0x65:
			opbytes = 1;
			cpu->H = cpu->L;
			break;
		case 0x66:
			opbytes = 1;
			cpu->H = read_memory_byte(cpu, make_word(cpu->H, cpu->L));
			break;
		case 0x67:
			opbytes = 1;
			cpu->H = cpu->A;
			break;
		case 0x68:
			opbytes = 1;
			cpu->L = cpu->B;
			break;
		case 0x69:
			opbytes = 1;
			cpu->L = cpu->C;
			break;
		case 0x6A:
			opbytes = 1;
			cpu->L = cpu->D;
			break;
		case 0x6B:
			opbytes = 1;
			cpu->L = cpu->E;
			break;
		case 0x6C:
			opbytes = 1;
			cpu->L = cpu->H;
			break;
		case 0x6D:
			opbytes = 1;
			cpu->L = cpu->L;
			break;
		case 0x6E:
			opbytes = 1;
			cpu->L = read_memory_byte(cpu, make_word(cpu->H, cpu->L));
			break;
		case 0x6F:
			opbytes = 1;
			cpu->L = cpu->A;
			break;
		case 0x70:
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), cpu->B);
			break;
		case 0x71:
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), cpu->C);
			break;
		case 0x72:
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), cpu->D);
			break;
		case 0x73:
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), cpu->E);
			break;
		case 0x74:
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), cpu->H);
			break;
		case 0x75:
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), cpu->L);
			break;
		case 0x76: 		//HLT
			opbytes =1;
			exit(EXIT_SUCCESS);
			break;
		case 0x77:
			opbytes = 1;
			write_memory_byte(cpu, make_word(cpu->H, cpu->L), cpu->A);
			break;
		case 0x78:
			opbytes = 1;
			cpu->A = cpu->B;
			break;
		case 0x79:
			opbytes = 1;
			cpu->A = cpu->C;
			break;
		case 0x7A:
			opbytes = 1;
			cpu->A = cpu->D;
			break;
		case 0x7B:
			opbytes = 1;
			cpu->A = cpu->E;
			break;
		case 0x7C:
			opbytes = 1;
			cpu->A = cpu->H;
			break;
		case 0x7D:
			opbytes = 1;
			cpu->A = cpu->L;
			break;
		case 0x7E:
			opbytes = 1;
			cpu->A = read_memory_byte(cpu, make_word(cpu->H, cpu->L));
			break;
		case 0x7F:
			opbytes = 1;
			cpu->A = cpu->A;
			break;
		case 0x80: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, cpu->B);
			break;
		case 0x81: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, cpu->C);
			break;
		case 0x82: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, cpu->D);
			break;
		case 0x83: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, cpu->E);
			break;
		case 0x84: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, cpu->H);
			break;
		case 0x85: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, cpu->L);
			break;
		case 0x86: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, read_memory_byte(cpu, make_word(cpu->H, cpu->L)));
			break;
		case 0x87: 		// ADD. bytes is added to accumulator
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, cpu->A);
			break;
		case 0x88:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (cpu->B + cpu->carry));
			break;
		case 0x89:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (cpu->C + cpu->carry));
			break;
		case 0x8A:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (cpu->D + cpu->carry));
			break;
		case 0x8B:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (cpu->E + cpu->carry));
			break;
		case 0x8C:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (cpu->H + cpu->carry));
			break;
		case 0x8D:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (cpu->L + cpu->carry));
			break;
		case 0x8E:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (read_memory_byte(cpu, make_word(cpu->H, cpu->L)) + cpu->carry));
			break;
		case 0x8F:		// ADC. 
			opbytes = 1;
			carry_add_to_reg(cpu, &cpu->A, (cpu->A + cpu->carry));
			break;
		case 0x90:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, cpu->B);
			break;
		case 0x91:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, cpu->C);
			break;
		case 0x92:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, cpu->D);
			break;
		case 0x93:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, cpu->E);
			break;
		case 0x94:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, cpu->H);
			break;
		case 0x95:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, cpu->L);
			break;
		case 0x96:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, read_memory_byte(cpu, make_word(cpu->H, cpu->L)));
			break;
		case 0x97:		// SUB. Subtract register from accumulatort
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, cpu->A);
			break;
		case 0x98:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (cpu->B + cpu->carry));
			break;
		case 0x99:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (cpu->C + cpu->carry));
			break;
		case 0x9A:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (cpu->D + cpu->carry));
			break;
		case 0x9B:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (cpu->E + cpu->carry));
			break;
		case 0x9C:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (cpu->H + cpu->carry));
			break;
		case 0x9D:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (cpu->L + cpu->carry));
			break;
		case 0x9E:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (read_memory_byte(cpu, make_word(cpu->H, cpu->L)) + cpu->carry));
			break;
		case 0x9F:		//SBB. sub reg from accu w/ borrow
			opbytes =1;
			carry_sub_from_reg(cpu, &cpu->A, (cpu->A + cpu->carry));
			break;
		case 0xA0:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, cpu->B);
			break;
		case 0xA1:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, cpu->C);
			break;
		case 0xA2:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, cpu->D);
			break;
		case 0xA3:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, cpu->E);
			break;
		case 0xA4:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, cpu->H);
			break;
		case 0xA5:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, cpu->L);
			break;
		case 0xA6:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, read_memory_byte(cpu, make_word(cpu->H, cpu->L)));
			break;
		case 0xA7:		// ANA. reg is anded with the accumulator
			opbytes = 1;
			carry_and_to_reg(cpu, &cpu->A, cpu->A);
			break;
		case 0xA8:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, cpu->B);
			break;
		case 0xA9:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, cpu->C);
			break;
		case 0xAA:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, cpu->D);
			break;
		case 0xAB:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, cpu->E);
			break;
		case 0xAC:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, cpu->H);
			break;
		case 0xAD:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, cpu->L);
			break;
		case 0xAE:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, read_memory_byte(cpu, make_word(cpu->H, cpu->L)));
			break;
		case 0xAF:		// XRA. reg is xored w/ accu
			opbytes =1;
			carry_xor_to_reg(cpu, &cpu->A, cpu->A);
			break;
		case 0xB0:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, cpu->B);
			break;
		case 0xB1:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, cpu->C);
			break;
		case 0xB2:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, cpu->D);
			break;
		case 0xB3:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, cpu->E);
			break;
		case 0xB4:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, cpu->H);
			break;
		case 0xB5:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, cpu->L);
			break;
		case 0xB6:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, read_memory_byte(cpu, make_word(cpu->H, cpu->L)));
			break;
		case 0xB7:		// ORA.reg is ored with accumulator
			opbytes =1;
			carry_or_to_reg(cpu, &cpu->A, cpu->A);
			break;
		case 0xb8:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, cpu->B);
			break;
		case 0xb9:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, cpu->C);
			break;
		case 0xba:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, cpu->D);
			break;
		case 0xbb:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, cpu->E);
			break;
		case 0xbc:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, cpu->H);
			break;
		case 0xbd:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, cpu->L);
			break;
		case 0xbe:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, read_memory_byte(cpu, make_word(cpu->H, cpu->L)));
			break;
		case 0xbf:		// CMP. reg is compared to the accumulator
			opbytes = 1;
			carry_cmp_to_reg(cpu, &cpu->A, cpu->A);
			break;
		case 0xC0:		// RNZ. return if not zero
			opbytes =1;
			if(cpu->zero == 0)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;
		case 0xC8:		// RZ.
			opbytes =1;
			if(cpu->zero == 1)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;
		case 0xC9:		// RET. return
			opbytes =1;
			cpu->program_counter = cpu->stack[cpu->stack_pointer];
			cpu->stack_pointer -=1;
			break;
		case 0xD0:		// RNC. return no carry
			opbytes =1;
			if(cpu->carry == 0)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;
		case 0xD8:		// RC
			opbytes =1;
			if(cpu->carry == 1)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;
		case 0xD9:		// RET. return
			opbytes =1;
			cpu->program_counter = cpu->stack[cpu->stack_pointer];
			cpu->stack_pointer -=1;
			break;
		case 0xE0:		// RPO.
			opbytes =1;
			if(cpu->parity == 0)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;
		case 0xE8:		// RPE.
			opbytes =1;
			if(cpu->parity == 1)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;
		case 0xF0:		// RP. 
			opbytes =1;
			if(cpu->sign == 0)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;
		case 0xF8:		// RM.
			opbytes =1;
			if(cpu->sign == 1)
			{
				cpu->program_counter = cpu->stack[cpu->stack_pointer];
				cpu->stack_pointer -=1;
			}
			break;

		default:
			opcode_error(cpu->instruction);
			break;
			//exit(EXIT_FAILURE);	
	}
	
	return opbytes;
}


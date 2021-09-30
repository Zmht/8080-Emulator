/**
 * disassembler.c
 * Description: This is a disassembler for Intel 8080 assembly.
 * Author: Zachary Hansen Terry
 */

#include "disassembler.h"

#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <libgen.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>

FILE* output_file;


int disassemble(char* filename, char* outfile)
{
	FILE* input_file;

	if(strcmp(outfile, "stdout") != 0)
	{
		if((output_file = fopen(outfile, "w")) == NULL)
		{
			printf("Error: could not open output file\n");
			exit(EXIT_FAILURE);
		}
	}

	if((input_file = fopen(filename, "rb")) == NULL)
	{
		printf("Error: could not input open file\n");
		exit(EXIT_FAILURE);
	}


	

	fseek(input_file, 0, SEEK_END);	
	long fsize = ftell(input_file);	
	fseek(input_file, 0, SEEK_SET);	

	unsigned char *buff = malloc(fsize + 1);	
	fread(buff, 1, fsize, input_file);				
	fclose(input_file);							

	buff[fsize] = 0;							


	for (int i = 0; i < fsize; i+= 1)			
	{
		switch (Disassemble8080(buff, i))
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
	

	free(buff);									// Free buffer
	return 0;
}


int Disassemble8080(unsigned char *codebuffer, int pc)
{
	unsigned char *code = &codebuffer[pc];
	int opbytes = 1;
	fprintf(output_file, "%04x	", pc);

	switch (*code)
	{
	case 0x00:
		fprintf(output_file, "NOP");
		break;
	case 0x01:
		fprintf(output_file, "LXI     B,#$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0x02:
		fprintf(output_file, "STAX    B");
		break;
	case 0x03:
		fprintf(output_file, "INX		B");
		break;
	case 0x04:
		fprintf(output_file, "INR     B");
		break;
	case 0x05:
		fprintf(output_file, "DCR     B");
		break;
	case 0x06:
		fprintf(output_file, "MVI     B,#$%02x", code[1]);
		break;
	case 0x07:
		fprintf(output_file, "RLC");
		break;
	case 0x08:
		fprintf(output_file, "NOP");
		break;
	case 0x09:
		fprintf(output_file, "DAD");                              /* Double Add */
		break;
	case 0x0A:
		fprintf(output_file, "LDAX");                             /* Load Accumulator */
		break;
	case 0x0b:
	 	fprintf(output_file, "DCX     B");
		break;
	case 0x0c:
	 	fprintf(output_file, "INR     C");
		break;
	case 0x0d:
	 	fprintf(output_file, "DCR     C");
		break;
	case 0x0e:
	 	fprintf(output_file, "MVI     C,#$%02x", code[1]);
		opbytes = 2;
		break;
	case 0x0f:
	 	fprintf(output_file, "RRC");
		break;
	case 0x10:
	 	fprintf(output_file, "NOP");
		break;
	case 0x11:
	 	fprintf(output_file, "LXI     D,#$%02x%02x",code[2], code[1]);
		opbytes = 3;
		break;
	case 0x12:
	 	fprintf(output_file, "STAX    D");
		break;
	case 0x13:
	 	fprintf(output_file, "INX     D");
		break;
	case 0x14:
	 	fprintf(output_file, "INR     D");
		break;
	case 0x15:
	 	fprintf(output_file, "DCR     D");
		break;
	case 0x16:
	 	fprintf(output_file, "MVI     D,#$%02x", code[1]);
		opbytes = 2;
		break;
	case 0x17:
	 	fprintf(output_file, "RAL	    1");
		break;
	case 0x18:
	 	fprintf(output_file, "NOP");
		break;
	case 0x19:
	 	fprintf(output_file, "DAD     D");
		break;
	case 0x1a:
	 	fprintf(output_file, "LDAX    D");
		break;
	case 0x1b:
	 	fprintf(output_file, "DCX     D");
		break;
	case 0x1c:
	 	fprintf(output_file, "INR     E");
		break;
	case 0x1d:
	 	fprintf(output_file, "DCR     E");
		break;
	case 0x1e:
	 	fprintf(output_file, "MVI     E,#$%02x", code[1]);
		opbytes = 2;
		break;
	case 0x1f:
	 	fprintf(output_file, "RAR");
		break;
	case 0x20:
	 	fprintf(output_file, "RIM");
		break;
	case 0x21:
	 	fprintf(output_file, "LXI     H,#$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0x22:
	 	fprintf(output_file, "SHLD    $%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0x23:
	 	fprintf(output_file, "INX     H");
		break;
	case 0x24:
	 	fprintf(output_file, "INR     H");
		break;
	case 0x25:
	 	fprintf(output_file, "DCR     H");
		break;
	case 0x26:
	 	fprintf(output_file, "MVI     H,#$%02x", code[1]);
		break;
	case 0x27:
	 	fprintf(output_file, "DAA");
		break;
	case 0x28:
	 	fprintf(output_file, "NOP");
		break;
	case 0x29:
	 	fprintf(output_file, "DAD     H");
		break;
	case 0x2a:
	 	fprintf(output_file, "LHLD    #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0x2b:
	 	fprintf(output_file, "DCX     H");
		break;
	case 0x2c:
	 	fprintf(output_file, "INR     L");
		break;
	case 0x2d:
	 	fprintf(output_file, "DCR     L");
		break;
	case 0x2e:
	 	fprintf(output_file, "MVI     L, #$%02x", code[1]);
		opbytes = 2;
		break;
	case 0x2f:
	 	fprintf(output_file, "CMA");
		break;
	case 0x30:
	 	fprintf(output_file, "SIM");
		break;
	case 0x31:
	 	fprintf(output_file, "LXI     SP, #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0x32:
	 	fprintf(output_file, "STA     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0x33:
	 	fprintf(output_file, "INX     SP");
		break;
	case 0x34:
	 	fprintf(output_file, "INR     M");
		break;
	case 0x35:
	 	fprintf(output_file, "DCR     M");
		break;
	case 0x36:
	 	fprintf(output_file, "MVI     M,#$%02x", code[1]);
		opbytes = 2;
		break;
	case 0x37:
	 	fprintf(output_file, "STC");
		break;
	case 0x38:
	 	fprintf(output_file, "NOP");
		break;
	case 0x39:
	 	fprintf(output_file, "DAD     SP");
		break;
	case 0x3a:
	 	fprintf(output_file, "LDA     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0x3b:
	 	fprintf(output_file, "DCX     SP");
		break;
	case 0x3c:
	 	fprintf(output_file, "INR     A");
		break;
	case 0x3d:
	 	fprintf(output_file, "DCR     A");
		break;
	case 0x3e:
	 	fprintf(output_file, "MVI     A,#$%02x", code[1]);
		opbytes = 2;
		break;
	case 0x3f:
	 	fprintf(output_file, "CMC");
		break;
	case 0x40:
	 	fprintf(output_file, "MOV     B,B");
		break;
	case 0x41:
	 	fprintf(output_file, "MOV     B,C");
		break;
	case 0x42:
	 	fprintf(output_file, "MOV     B,D");
		break;
	case 0x43:
	 	fprintf(output_file, "MOV     B,E");
		break;
	case 0x44:
	 	fprintf(output_file, "MOV     B,H");
		break;
	case 0x45:
	 	fprintf(output_file, "MOV     B,L");
		break;
	case 0x46:
	 	fprintf(output_file, "MOV     B,M");
		break;
	case 0x47:
	 	fprintf(output_file, "MOV     B,A");
		break;
	case 0x48:
	 	fprintf(output_file, "MOV     C,B");
		break;
	case 0x49:
	 	fprintf(output_file, "MOV     C,C");
		break;
	case 0x4a:
	 	fprintf(output_file, "MOV     C,D");
		break;
	case 0x4b:
	 	fprintf(output_file, "MOV     C,E");
		break;
	case 0x4c:
	 	fprintf(output_file, "MOV     C,H");
		break;
	case 0x4d:
	 	fprintf(output_file, "MOV     C,L");
		break;
	case 0x4e:
	 	fprintf(output_file, "MOV     C,M");
		break;
	case 0x4f:
	 	fprintf(output_file, "MOV     C,A");
		break;
	case 0x50:
	 	fprintf(output_file, "MOV     D,B");
		break;
	case 0x51:
	 	fprintf(output_file, "MOV     D,C");
		break;
	case 0x52:
	 	fprintf(output_file, "MOV     D,D");
		break;
	case 0x53:
	 	fprintf(output_file, "MOV     D,E");
		break;
	case 0x54:
	 	fprintf(output_file, "MOV     D,H");
		break;
	case 0x55:
	 	fprintf(output_file, "MOV     D,L");
		break;
	case 0x56:
	 	fprintf(output_file, "MOV     D,M");
		break;
	case 0x57:
	 	fprintf(output_file, "MOV     D,A");
		break;
	case 0x58:
	 	fprintf(output_file, "MOV     E,B");
		break;
	case 0x59:
	 	fprintf(output_file, "MOV     E,C");
		break;
	case 0x5a:
	 	fprintf(output_file, "MOV     E,D");
		break;
	case 0x5b:
	 	fprintf(output_file, "MOV     E,E");
		break;
	case 0x5c:
	 	fprintf(output_file, "MOV     E,H	");
		break;
	case 0x5d:
	 	fprintf(output_file, "MOV     E,L	");
		break;
	case 0x5e:
	 	fprintf(output_file, "MOV     E,M");
		break;
	case 0x5f:
	 	fprintf(output_file, "MOV     E,A");
		break;
	case 0x60:
	 	fprintf(output_file, "MOV     H,B");
		break;
	case 0x61:
	 	fprintf(output_file, "MOV     H,C");
		break;
	case 0x62:
	 	fprintf(output_file, "MOV     H,D");
		break;
	case 0x63:
	 	fprintf(output_file, "MOV     H,E");
		break;
	case 0x64:
	 	fprintf(output_file, "MOV     H,H");
		break;
	case 0x65:
	 	fprintf(output_file, "MOV     H,L");
		break;
	case 0x66:
	 	fprintf(output_file, "MOV     H,M");
		break;
	case 0x67:
	 	fprintf(output_file, "MOV     H,A");
		break;
	case 0x68:
	 	fprintf(output_file, "MOV     L,B");
		break;
	case 0x69:
	 	fprintf(output_file, "MOV     L,C");
		break;
	case 0x6a:
	 	fprintf(output_file, "MOV     L,D");
		break;
	case 0x6b:
	 	fprintf(output_file, "MOV     L,E");
		break;
	case 0x6c:
	 	fprintf(output_file, "MOV     L,H");
		break;
	case 0x6d:
	 	fprintf(output_file, "MOV     L,L");
		break;
	case 0x6e:
	 	fprintf(output_file, "MOV     L,M");
		break;
	case 0x6f:
	 	fprintf(output_file, "MOV     L,A");
		break;
	case 0x70:
	 	fprintf(output_file, "MOV     M,B");
		break;
	case 0x71:
	 	fprintf(output_file, "MOV     M,C");
		break;
	case 0x72:
	 	fprintf(output_file, "MOV     M,D");
		break;
	case 0x73:
	 	fprintf(output_file, "MOV     M,E");
		break;
	case 0x74:
	 	fprintf(output_file, "MOV     M,H");
		break;
	case 0x75:
	 	fprintf(output_file, "MOV     M,L");
		break;
	case 0x76:
	 	fprintf(output_file, "HLT");
		break;
	case 0x77:
	 	fprintf(output_file, "MOV     M,A");
		break;
	case 0x78:
	 	fprintf(output_file, "MOV     A,B");
		break;
	case 0x79:
	 	fprintf(output_file, "MOV     A,C");
		break;
	case 0x7a:
	 	fprintf(output_file, "MOV     A,D");
		break;
	case 0x7b:
	 	fprintf(output_file, "MOV     A,E");
		break;
	case 0x7c:
	 	fprintf(output_file, "MOV     A,H");
		break;
	case 0x7d:
	 	fprintf(output_file, "MOV     A,L");
		break;
	case 0x7e:
	 	fprintf(output_file, "MOV     A,M");
		break;
	case 0x7f:
	 	fprintf(output_file, "MOV     A,A");
		break;
	case 0x80:
	 	fprintf(output_file, "ADD     B");
		break;
	case 0x81:
	 	fprintf(output_file, "ADD     C");
		break;
	case 0x82:
	 	fprintf(output_file, "ADD     D");
		break;
	case 0x83:
	 	fprintf(output_file, "ADD     E");
		break;
	case 0x84:
	 	fprintf(output_file, "ADD     H");
		break;
	case 0x85:
	 	fprintf(output_file, "ADD     L");
		break;
	case 0x86:
	 	fprintf(output_file, "ADD     M");
		break;
	case 0x87:
	 	fprintf(output_file, "ADD     A");
		break;
	case 0x88:
	 	fprintf(output_file, "ADC     B");
		break;
	case 0x89:
	 	fprintf(output_file, "ADC     C");
		break;
	case 0x8a:
	 	fprintf(output_file, "ADC     D");
		break;
	case 0x8b:
	 	fprintf(output_file, "ADC     E");
		break;
	case 0x8c:
	 	fprintf(output_file, "ADC     H");
		break;
	case 0x8d:
	 	fprintf(output_file, "ADC     L");
		break;
	case 0x8e:
	 	fprintf(output_file, "ADC     M");
		break;
	case 0x8f:
	 	fprintf(output_file, "ADC     A");
		break;
	case 0x90:
	 	fprintf(output_file, "SUB     B");
		break;
	case 0x91:
	 	fprintf(output_file, "SUB     C");
		break;
	case 0x92:
	 	fprintf(output_file, "SUB     D");
		break;
	case 0x93:
	 	fprintf(output_file, "SUB     E");
		break;
	case 0x94:
	 	fprintf(output_file, "SUB     H");
		break;
	case 0x95:
	 	fprintf(output_file, "SUB     L");
		break;
	case 0x96:
	 	fprintf(output_file, "SUB     M");
		break;
	case 0x97:
	 	fprintf(output_file, "SUB     A");
		break;
	case 0x98:
	 	fprintf(output_file, "SBB     B");
		break;
	case 0x99:
	 	fprintf(output_file, "SBB     C");
		break;
	case 0x9a:
	 	fprintf(output_file, "SBB     D");
		break;
	case 0x9b:
	 	fprintf(output_file, "SBB     E");
		break;
	case 0x9c:
	 	fprintf(output_file, "SBB     H");
		break;
	case 0x9d:
	 	fprintf(output_file, "SBB     L");
		break;
	case 0x9e:
	 	fprintf(output_file, "SBB     M");
		break;
	case 0x9f:
	 	fprintf(output_file, "SBB     A");
		break;
	case 0xa0:
	 	fprintf(output_file, "ANA     B");
		break;
	case 0xa1:
	 	fprintf(output_file, "ANA     C");
		break;
	case 0xa2:
	 	fprintf(output_file, "ANA     D");
		break;
	case 0xa3:
	 	fprintf(output_file, "ANA     E");
		break;
	case 0xa4:
	 	fprintf(output_file, "ANA     H");
		break;
	case 0xa5:
	 	fprintf(output_file, "ANA     L");
		break;
	case 0xa6:
	 	fprintf(output_file, "ANA     M");
		break;
	case 0xa7:
	 	fprintf(output_file, "ANA     A");
		break;
	case 0xa8:
	 	fprintf(output_file, "XRA     B");
		break;
	case 0xa9:
	 	fprintf(output_file, "XRA     C");
		break;
	case 0xaa:
	 	fprintf(output_file, "XRA     D");
		break;
	case 0xab:
	 	fprintf(output_file, "XRA     E");
		break;
	case 0xac:
	 	fprintf(output_file, "XRA     H");
		break;
	case 0xad:
	 	fprintf(output_file, "XRA     L");
		break;
	case 0xae:
	 	fprintf(output_file, "XRA     M");
		break;
	case 0xaf:
	 	fprintf(output_file, "XRA     A");
		break;
	case 0xb0:
	 	fprintf(output_file, "ORA     B");
		break;
	case 0xb1:
	 	fprintf(output_file, "ORA     C");
		break;
	case 0xb2:
	 	fprintf(output_file, "ORA     D");
		break;
	case 0xb3:
	 	fprintf(output_file, "ORA     E");
		break;
	case 0xb4:
	 	fprintf(output_file, "ORA     H");
		break;
	case 0xb5:
	 	fprintf(output_file, "ORA     L");
		break;
	case 0xb6:
	 	fprintf(output_file, "ORA     M");
		break;
	case 0xb7:
	 	fprintf(output_file, "ORA     A");
		break;
	case 0xb8:
	 	fprintf(output_file, "CMP     B");
		break;
	case 0xb9:
	 	fprintf(output_file, "CMP     C");
		break;
	case 0xba:
	 	fprintf(output_file, "CMP     D");
		break;
	case 0xbb:
	 	fprintf(output_file, "CMP     E");
		break;
	case 0xbc:
	 	fprintf(output_file, "CMP     H");
		break;
	case 0xbd:
	 	fprintf(output_file, "CMP     L");
		break;
	case 0xbe:
	 	fprintf(output_file, "CMP     M");
		break;
	case 0xbf:
	 	fprintf(output_file, "CMP     A");
		break;
	case 0xc0:
	 	fprintf(output_file, "RNZ");
		break;
	case 0xc1:
	 	fprintf(output_file, "POP     B");
		break;
	case 0xc2:
	 	fprintf(output_file, "JNZ     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xc3:
	 	fprintf(output_file, "JMP     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xc4:
	 	fprintf(output_file, "CNZ     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xc5:
	 	fprintf(output_file, "PUSH    B");
		break;
	case 0xc6:
	 	fprintf(output_file, "ADI     #$%02x", code[1]);
		opbytes = 0;
		break;
	case 0xc7:
	 	fprintf(output_file, "RST     0");
		break;
	case 0xc8:
	 	fprintf(output_file, "RZ");
		break;
	case 0xc9:
	 	fprintf(output_file, "RET");
		break;
	case 0xca:
	 	fprintf(output_file, "JZ      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xcb:
	 	fprintf(output_file, "NOP");
		break;
	case 0xcc:
	 	fprintf(output_file, "CZ      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xcd:
	 	fprintf(output_file, "CALL    #$%02x%02x", code[2], code[1]);
		 opbytes = 3;
		break;
	case 0xce:
	 	fprintf(output_file, "ACI     #$%02x", code[1]);
		opbytes = 2;
		break;
	case 0xcf:
	 	fprintf(output_file, "RST     1");
		break;
	case 0xd0:
	 	fprintf(output_file, "RNC	    1");
		break;
	case 0xd1:
	 	fprintf(output_file, "POP     D");
		break;
	case 0xd2:
	 	fprintf(output_file, "JNC     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xd3:
	 	fprintf(output_file, "OUT     #$%02x", code[1]);
		 opbytes = 2;
		break;
	case 0xd4:
	 	fprintf(output_file, "CNC     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xd5:
	 	fprintf(output_file, "PUSH    D");
		break;
	case 0xd6:
	 	fprintf(output_file, "SUI     #$%02x", code[1]);
		opbytes = 2;
		break;
	case 0xd7:
	 	fprintf(output_file, "RST     2");
		break;
	case 0xd8:
	 	fprintf(output_file, "RC");
		break;
	case 0xd9:
	 	fprintf(output_file, "NOP");
		break;
	case 0xda:
	 	fprintf(output_file, "JC      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xdb:
	 	fprintf(output_file, "IN      #$%02x", code[1]);
		opbytes = 2;
		break;
	case 0xdc:
	 	fprintf(output_file, "CC      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xdd:
	 	fprintf(output_file, "NOP");
		break;
	case 0xde:
	 	fprintf(output_file, "SBI     #$%02x", code[1]);
		opbytes = 2;
		break;
	case 0xdf:
	 	fprintf(output_file, "RST     3");
		break;
	case 0xe0:
	 	fprintf(output_file, "RPO");
		break;
	case 0xe1:
	 	fprintf(output_file, "POP     H");
		break;
	case 0xe2:
	 	fprintf(output_file, "JPO     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xe3:
	 	fprintf(output_file, "XTHL");
		break;
	case 0xe4:
	 	fprintf(output_file, "CPO     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xe5:
	 	fprintf(output_file, "PUSH    H");
		break;
	case 0xe6:
	 	fprintf(output_file, "ANI     #$%02x", code[1]);
		opbytes = 3;
		break;
	case 0xe7:
	 	fprintf(output_file, "RST     4");
		break;
	case 0xe8:
	 	fprintf(output_file, "RPE");
		break;
	case 0xe9:
	 	fprintf(output_file, "PCHL");
		break;
	case 0xea:
	 	fprintf(output_file, "JPE     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xeb:
	 	fprintf(output_file, "XCHG");
		break;
	case 0xec:
	 	fprintf(output_file, "CPE     #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xed:
	 	fprintf(output_file, "NOP");
		break;
	case 0xee:
	 	fprintf(output_file, "XRI     #$%02x", code[1]);
		opbytes = 2;
		break;
	case 0xef:
	 	fprintf(output_file, "RST     5");
		break;
	case 0xf0:
	 	fprintf(output_file, "RP");
		break;
	case 0xf1:
	 	fprintf(output_file, "POP     PSW");
		break;
	case 0xf2:
	 	fprintf(output_file, "JP      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xf3:
	 	fprintf(output_file, "DI");
		break;
	case 0xf4:
	 	fprintf(output_file, "CP      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xf5:
	 	fprintf(output_file, "PUSH    PSW");
		break;
	case 0xf6:
	 	fprintf(output_file, "ORI     #$%02x", code[1]);
		opbytes = 3;
		break;
	case 0xf7:
	 	fprintf(output_file, "RST     6");
		break;
	case 0xf8:
	 	fprintf(output_file, "RM");
		break;
	case 0xf9:
	 	fprintf(output_file, "SPHL");
		break;
	case 0xfa:
	 	fprintf(output_file, "JM      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xfb:
	 	fprintf(output_file, "EI");
		break;
	case 0xfc:
	 	fprintf(output_file, "CM      #$%02x%02x", code[2], code[1]);
		opbytes = 3;
		break;
	case 0xfd:
	 	fprintf(output_file, "NOP");
		break;
	case 0xfe:
	 	fprintf(output_file, "CPI		#$%02x", code[1]);
		opbytes = 2;
		break;
	case 0xff:
	 	fprintf(output_file, "RST     7");
		break;
	}

	fprintf(output_file, "	\n");


	return opbytes;
}

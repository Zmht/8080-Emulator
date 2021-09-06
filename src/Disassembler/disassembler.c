/**
 * Description: This is a disassembler for the Intel 8080 CPU.
 * Author: Zachary Hansen Terry
 */

#include <stdio.h>
#include <unistd.h>

int Disassemble8080(unsigned char *codebuffer, int pc);

int main(int argc, char *argv[])
{

    return 0;
}

int Disassemble8080(unsigned char *codebuffer, int pc)
{
    unsigned char *code = &codebuffer[pc];
    int opbytes = 1;
    printf("%04x ", pc);

    switch (*code)
    {
    case 0x00:
        printf("NOP");
        break;
    case 0x01:
        printf("LXI     B,#$%02x%02x", code[2], code[1]);
        opbytes = 3;
        break;
    case 0x02:
        printf("STAX    B");
        break;
    case 0x03:
        printf("INX		B");
        break;
    case 0x04:
        printf("INR     B");
        break;
    case 0x05:
        printf("DCR     B");
        break;
    case 0x06:
        printf("MVI     B,#$%02x", code[2]);
        break;
    case 0x07:
        printf("RLC");
        break;
    case 0x08:
        printf("NOP");
        break;
    case 0x09:
        printf("DAD");                              /* Double Add */
        break;
    case 0x0A:
        printf("LDAX");                             /* Load Accumulator */
        break;
    case 0x0b:
     	printf("DCX B	1		BC = BC-1");
        break;
    case 0x0c:
     	printf("INR C	1	Z, S, P, AC	C <- C+1");
        break;
    case 0x0d:
     	printf("DCR C	1	Z, S, P, AC	C <-C-1");
        break;
    case 0x0e:
     	printf("MVI C,D8	2		C <- byte 2");
        break;
    case 0x0f:
     	printf("RRC	1	CY	A = A >> 1; bit 7 = prev bit 0; CY = prev bit 0");
        break;
    case 0x10:
     	printf("-			");
        break;
    case 0x11:
     	printf("LXI D,D16	3		D <- byte 3, E <- byte 2");
        break;
    case 0x12:
     	printf("STAX D	1		(DE) <- A");
        break;
    case 0x13:
     	printf("INX D	1		DE <- DE + 1");
        break;
    case 0x14:
     	printf("INR D	1	Z, S, P, AC	D <- D+1");
        break;
    case 0x15:
     	printf("DCR D	1	Z, S, P, AC	D <- D-1");
        break;
    case 0x16:
     	printf("MVI D, D8	2		D <- byte 2");
        break;
    case 0x17:
     	printf("RAL	1	CY	A = A << 1; bit 0 = prev CY; CY = prev bit 7");
        break;
    case 0x18:
     	printf("-			");
        break;
    case 0x19:
     	printf("DAD D	1	CY	HL = HL + DE");
        break;
    case 0x1a:
     	printf("LDAX D	1		A <- (DE)");
        break;
    case 0x1b:
     	printf("DCX D	1		DE = DE-1");
        break;
    case 0x1c:
     	printf("INR E	1	Z, S, P, AC	E <-E+1");
        break;
    case 0x1d:
     	printf("DCR E	1	Z, S, P, AC	E <- E-1");
        break;
    case 0x1e:
     	printf("MVI E,D8	2		E <- byte 2");
        break;
    case 0x1f:
     	printf("RAR	1	CY	A = A >> 1; bit 7 = prev bit 7; CY = prev bit 0");
        break;
    case 0x20:
     	printf("RIM	1		special");
        break;
    case 0x21:
     	printf("LXI H,D16	3		H <- byte 3, L <- byte 2");
        break;
    case 0x22:
     	printf("SHLD adr	3		(adr) <-L; (adr+1)<-H");
        break;
    case 0x23:
     	printf("INX H	1		HL <- HL + 1");
        break;
    case 0x24:
     	printf("INR H	1	Z, S, P, AC	H <- H+1");
        break;
    case 0x25:
     	printf("DCR H	1	Z, S, P, AC	H <- H-1");
        break;
    case 0x26:
     	printf("MVI H,D8	2		L <- byte 2");
        break;
    case 0x27:
     	printf("DAA	1		special");
        break;
    case 0x28:
     	printf("-			");
        break;
    case 0x29:
     	printf("DAD H	1	CY	HL = HL + HI");
        break;
    case 0x2a:
     	printf("LHLD adr	3		L <- (adr); H<-(adr+1)");
        break;
    case 0x2b:
     	printf("DCX H	1		HL = HL-1");
        break;
    case 0x2c:
     	printf("INR L	1	Z, S, P, AC	L <- L+1");
        break;
    case 0x2d:
     	printf("DCR L	1	Z, S, P, AC	L <- L-1");
        break;
    case 0x2e:
     	printf("MVI L, D8	2		L <- byte 2");
        break;
    case 0x2f:
     	printf("CMA	1		A <- !A");
        break;
    case 0x30:
     	printf("SIM	1		special");
        break;
    case 0x31:
     	printf("LXI SP, D16	3		SP.hi <- byte 3, SP.lo <- byte 2");
        break;
    case 0x32:
     	printf("STA adr	3		(adr) <- A");
        break;
    case 0x33:
     	printf("INX SP	1		SP = SP + 1");
        break;
    case 0x34:
     	printf("INR M	1	Z, S, P, AC	(HL) <- (HL)+1");
        break;
    case 0x35:
     	printf("DCR M	1	Z, S, P, AC	(HL) <- (HL)-1");
        break;
    case 0x36:
     	printf("MVI M,D8	2		(HL) <- byte 2");
        break;
    case 0x37:
     	printf("STC	1	CY	CY = 1");
        break;
    case 0x38:
     	printf("-			");
        break;
    case 0x39:
     	printf("DAD SP	1	CY	HL = HL + SP");
        break;
    case 0x3a:
     	printf("LDA adr	3		A <- (adr)");
        break;
    case 0x3b:
     	printf("DCX SP	1		SP = SP-1");
        break;
    case 0x3c:
     	printf("INR A	1	Z, S, P, AC	A <- A+1");
        break;
    case 0x3d:
     	printf("DCR A	1	Z, S, P, AC	A <- A-1");
        break;
    case 0x3e:
     	printf("MVI A,D8	2		A <- byte 2");
        break;
    case 0x3f:
     	printf("CMC	1	CY	CY=!CY");
        break;
    case 0x40:
     	printf("MOV B,B	1		B <- B");
        break;
    case 0x41:
     	printf("MOV B,C	1		B <- C");
        break;
    case 0x42:
     	printf("MOV B,D	1		B <- D");
        break;
    case 0x43:
     	printf("MOV B,E	1		B <- E");
        break;
    case 0x44:
     	printf("MOV B,H	1		B <- H");
        break;
    case 0x45:
     	printf("MOV B,L	1		B <- L");
        break;
    case 0x46:
     	printf("MOV B,M	1		B <- (HL)");
        break;
    case 0x47:
     	printf("MOV B,A	1		B <- A");
        break;
    case 0x48:
     	printf("MOV C,B	1		C <- B");
        break;
    case 0x49:
     	printf("MOV C,C	1		C <- C");
        break;
    case 0x4a:
     	printf("MOV C,D	1		C <- D");
        break;
    case 0x4b:
     	printf("MOV C,E	1		C <- E");
        break;
    case 0x4c:
     	printf("MOV C,H	1		C <- H");
        break;
    case 0x4d:
     	printf("MOV C,L	1		C <- L");
        break;
    case 0x4e:
     	printf("MOV C,M	1		C <- (HL)");
        break;
    case 0x4f:
     	printf("MOV C,A	1		C <- A");
        break;
    case 0x50:
     	printf("MOV D,B	1		D <- B");
        break;
    case 0x51:
     	printf("MOV D,C	1		D <- C");
        break;
    case 0x52:
     	printf("MOV D,D	1		D <- D");
        break;
    case 0x53:
     	printf("MOV D,E	1		D <- E");
        break;
    case 0x54:
     	printf("MOV D,H	1		D <- H");
        break;
    case 0x55:
     	printf("MOV D,L	1		D <- L");
        break;
    case 0x56:
     	printf("MOV D,M	1		D <- (HL)");
        break;
    case 0x57:
     	printf("MOV D,A	1		D <- A");
        break;
    case 0x58:
     	printf("MOV E,B	1		E <- B");
        break;
    case 0x59:
     	printf("MOV E,C	1		E <- C");
        break;
    case 0x5a:
     	printf("MOV E,D	1		E <- D");
        break;
    case 0x5b:
     	printf("MOV E,E	1		E <- E");
        break;
    case 0x5c:
     	printf("MOV E,H	1		E <- H");
        break;
    case 0x5d:
     	printf("MOV E,L	1		E <- L");
        break;
    case 0x5e:
     	printf("MOV E,M	1		E <- (HL)");
        break;
    case 0x5f:
     	printf("MOV E,A	1		E <- A");
        break;
    case 0x60:
     	printf("MOV H,B	1		H <- B");
        break;
    case 0x61:
     	printf("MOV H,C	1		H <- C");
        break;
    case 0x62:
     	printf("MOV H,D	1		H <- D");
        break;
    case 0x63:
     	printf("MOV H,E	1		H <- E");
        break;
    case 0x64:
     	printf("MOV H,H	1		H <- H");
        break;
    case 0x65:
     	printf("MOV H,L	1		H <- L");
        break;
    case 0x66:
     	printf("MOV H,M	1		H <- (HL)");
        break;
    case 0x67:
     	printf("MOV H,A	1		H <- A");
        break;
    case 0x68:
     	printf("MOV L,B	1		L <- B");
        break;
    case 0x69:
     	printf("MOV L,C	1		L <- C");
        break;
    case 0x6a:
     	printf("MOV L,D	1		L <- D");
        break;
    case 0x6b:
     	printf("MOV L,E	1		L <- E");
        break;
    case 0x6c:
     	printf("MOV L,H	1		L <- H");
        break;
    case 0x6d:
     	printf("MOV L,L	1		L <- L");
        break;
    case 0x6e:
     	printf("MOV L,M	1		L <- (HL)");
        break;
    case 0x6f:
     	printf("MOV L,A	1		L <- A");
        break;
    case 0x70:
     	printf("MOV M,B	1		(HL) <- B");
        break;
    case 0x71:
     	printf("MOV M,C	1		(HL) <- C");
        break;
    case 0x72:
     	printf("MOV M,D	1		(HL) <- D");
        break;
    case 0x73:
     	printf("MOV M,E	1		(HL) <- E");
        break;
    case 0x74:
     	printf("MOV M,H	1		(HL) <- H");
        break;
    case 0x75:
     	printf("MOV M,L	1		(HL) <- L");
        break;
    case 0x76:
     	printf("HLT	1		special");
        break;
    case 0x77:
     	printf("MOV M,A	1		(HL) <- C");
        break;
    case 0x78:
     	printf("MOV A,B	1		A <- B");
        break;
    case 0x79:
     	printf("MOV A,C	1		A <- C");
        break;
    case 0x7a:
     	printf("MOV A,D	1		A <- D");
        break;
    case 0x7b:
     	printf("MOV A,E	1		A <- E");
        break;
    case 0x7c:
     	printf("MOV A,H	1		A <- H");
        break;
    case 0x7d:
     	printf("MOV A,L	1		A <- L");
        break;
    case 0x7e:
     	printf("MOV A,M	1		A <- (HL)");
        break;
    case 0x7f:
     	printf("MOV A,A	1		A <- A");
        break;
    case 0x80:
     	printf("ADD B	1	Z, S, P, CY, AC	A <- A + B");
        break;
    case 0x81:
     	printf("ADD C	1	Z, S, P, CY, AC	A <- A + C");
        break;
    case 0x82:
     	printf("ADD D	1	Z, S, P, CY, AC	A <- A + D");
        break;
    case 0x83:
     	printf("ADD E	1	Z, S, P, CY, AC	A <- A + E");
        break;
    case 0x84:
     	printf("ADD H	1	Z, S, P, CY, AC	A <- A + H");
        break;
    case 0x85:
     	printf("ADD L	1	Z, S, P, CY, AC	A <- A + L");
        break;
    case 0x86:
     	printf("ADD M	1	Z, S, P, CY, AC	A <- A + (HL)");
        break;
    case 0x87:
     	printf("ADD A	1	Z, S, P, CY, AC	A <- A + A");
        break;
    case 0x88:
     	printf("ADC B	1	Z, S, P, CY, AC	A <- A + B + CY");
        break;
    case 0x89:
     	printf("ADC C	1	Z, S, P, CY, AC	A <- A + C + CY");
        break;
    case 0x8a:
     	printf("ADC D	1	Z, S, P, CY, AC	A <- A + D + CY");
        break;
    case 0x8b:
     	printf("ADC E	1	Z, S, P, CY, AC	A <- A + E + CY");
        break;
    case 0x8c:
     	printf("ADC H	1	Z, S, P, CY, AC	A <- A + H + CY");
        break;
    case 0x8d:
     	printf("ADC L	1	Z, S, P, CY, AC	A <- A + L + CY");
        break;
    case 0x8e:
     	printf("ADC M	1	Z, S, P, CY, AC	A <- A + (HL) + CY");
        break;
    case 0x8f:
     	printf("ADC A	1	Z, S, P, CY, AC	A <- A + A + CY");
        break;
    case 0x90:
     	printf("SUB B	1	Z, S, P, CY, AC	A <- A - B");
        break;
    case 0x91:
     	printf("SUB C	1	Z, S, P, CY, AC	A <- A - C");
        break;
    case 0x92:
     	printf("SUB D	1	Z, S, P, CY, AC	A <- A + D");
        break;
    case 0x93:
     	printf("SUB E	1	Z, S, P, CY, AC	A <- A - E");
        break;
    case 0x94:
     	printf("SUB H	1	Z, S, P, CY, AC	A <- A + H");
        break;
    case 0x95:
     	printf("SUB L	1	Z, S, P, CY, AC	A <- A - L");
        break;
    case 0x96:
     	printf("SUB M	1	Z, S, P, CY, AC	A <- A + (HL)");
        break;
    case 0x97:
     	printf("SUB A	1	Z, S, P, CY, AC	A <- A - A");
        break;
    case 0x98:
     	printf("SBB B	1	Z, S, P, CY, AC	A <- A - B - CY");
        break;
    case 0x99:
     	printf("SBB C	1	Z, S, P, CY, AC	A <- A - C - CY");
        break;
    case 0x9a:
     	printf("SBB D	1	Z, S, P, CY, AC	A <- A - D - CY");
        break;
    case 0x9b:
     	printf("SBB E	1	Z, S, P, CY, AC	A <- A - E - CY");
        break;
    case 0x9c:
     	printf("SBB H	1	Z, S, P, CY, AC	A <- A - H - CY");
        break;
    case 0x9d:
     	printf("SBB L	1	Z, S, P, CY, AC	A <- A - L - CY");
        break;
    case 0x9e:
     	printf("SBB M	1	Z, S, P, CY, AC	A <- A - (HL) - CY");
        break;
    case 0x9f:
     	printf("SBB A	1	Z, S, P, CY, AC	A <- A - A - CY");
        break;
    case 0xa0:
     	printf("ANA B	1	Z, S, P, CY, AC	A <- A & B");
        break;
    case 0xa1:
     	printf("ANA C	1	Z, S, P, CY, AC	A <- A & C");
        break;
    case 0xa2:
     	printf("ANA D	1	Z, S, P, CY, AC	A <- A & D");
        break;
    case 0xa3:
     	printf("ANA E	1	Z, S, P, CY, AC	A <- A & E");
        break;
    case 0xa4:
     	printf("ANA H	1	Z, S, P, CY, AC	A <- A & H");
        break;
    case 0xa5:
     	printf("ANA L	1	Z, S, P, CY, AC	A <- A & L");
        break;
    case 0xa6:
     	printf("ANA M	1	Z, S, P, CY, AC	A <- A & (HL)");
        break;
    case 0xa7:
     	printf("ANA A	1	Z, S, P, CY, AC	A <- A & A");
        break;
    case 0xa8:
     	printf("XRA B	1	Z, S, P, CY, AC	A <- A ^ B");
        break;
    case 0xa9:
     	printf("XRA C	1	Z, S, P, CY, AC	A <- A ^ C");
        break;
    case 0xaa:
     	printf("XRA D	1	Z, S, P, CY, AC	A <- A ^ D");
        break;
    case 0xab:
     	printf("XRA E	1	Z, S, P, CY, AC	A <- A ^ E");
        break;
    case 0xac:
     	printf("XRA H	1	Z, S, P, CY, AC	A <- A ^ H");
        break;
    case 0xad:
     	printf("XRA L	1	Z, S, P, CY, AC	A <- A ^ L");
        break;
    case 0xae:
     	printf("XRA M	1	Z, S, P, CY, AC	A <- A ^ (HL)");
        break;
    case 0xaf:
     	printf("XRA A	1	Z, S, P, CY, AC	A <- A ^ A");
        break;
    case 0xb0:
     	printf("ORA B	1	Z, S, P, CY, AC	A <- A | B");
        break;
    case 0xb1:
     	printf("ORA C	1	Z, S, P, CY, AC	A <- A | C");
        break;
    case 0xb2:
     	printf("ORA D	1	Z, S, P, CY, AC	A <- A | D");
        break;
    case 0xb3:
     	printf("ORA E	1	Z, S, P, CY, AC	A <- A | E");
        break;
    case 0xb4:
     	printf("ORA H	1	Z, S, P, CY, AC	A <- A | H");
        break;
    case 0xb5:
     	printf("ORA L	1	Z, S, P, CY, AC	A <- A | L");
        break;
    case 0xb6:
     	printf("ORA M	1	Z, S, P, CY, AC	A <- A | (HL)");
        break;
    case 0xb7:
     	printf("ORA A	1	Z, S, P, CY, AC	A <- A | A");
        break;
    case 0xb8:
     	printf("CMP B	1	Z, S, P, CY, AC	A - B");
        break;
    case 0xb9:
     	printf("CMP C	1	Z, S, P, CY, AC	A - C");
        break;
    case 0xba:
     	printf("CMP D	1	Z, S, P, CY, AC	A - D");
        break;
    case 0xbb:
     	printf("CMP E	1	Z, S, P, CY, AC	A - E");
        break;
    case 0xbc:
     	printf("CMP H	1	Z, S, P, CY, AC	A - H");
        break;
    case 0xbd:
     	printf("CMP L	1	Z, S, P, CY, AC	A - L");
        break;
    case 0xbe:
     	printf("CMP M	1	Z, S, P, CY, AC	A - (HL)");
        break;
    case 0xbf:
     	printf("CMP A	1	Z, S, P, CY, AC	A - A");
        break;
    case 0xc0:
     	printf("RNZ	1		if NZ, RET");
        break;
    case 0xc1:
     	printf("POP B	1		C <- (sp); B <- (sp+1); sp <- sp+2");
        break;
    case 0xc2:
     	printf("JNZ adr	3		if NZ, PC <- adr");
        break;
    case 0xc3:
     	printf("JMP adr	3		PC <= adr");
        break;
    case 0xc4:
     	printf("CNZ adr	3		if NZ, CALL adr");
        break;
    case 0xc5:
     	printf("PUSH B	1		(sp-2)<-C; (sp-1)<-B; sp <- sp - 2");
        break;
    case 0xc6:
     	printf("ADI D8	2	Z, S, P, CY, AC	A <- A + byte");
        break;
    case 0xc7:
     	printf("RST 0	1		CALL $0");
        break;
    case 0xc8:
     	printf("RZ	1		if Z, RET");
        break;
    case 0xc9:
     	printf("RET	1		PC.lo <- (sp); PC.hi<-(sp+1); SP <- SP+2");
        break;
    case 0xca:
     	printf("JZ adr	3		if Z, PC <- adr");
        break;
    case 0xcb:
     	printf("-			");
        break;
    case 0xcc:
     	printf("CZ adr	3		if Z, CALL adr");
        break;
    case 0xcd:
     	printf("CALL adr	3		(SP-1)<-PC.hi;(SP-2)<-PC.lo;SP<-SP+2;PC");
        break;
    case 0xce:
     	printf("ACI D8	2	Z, S, P, CY, AC	A <- A + data + CY");
        break;
    case 0xcf:
     	printf("RST 1	1		CALL $8");
        break;
    case 0xd0:
     	printf("RNC	1		if NCY, RET");
        break;
    case 0xd1:
     	printf("POP D	1		E <- (sp); D <- (sp+1); sp <- sp+2");
        break;
    case 0xd2:
     	printf("JNC adr	3		if NCY, PC<-adr");
        break;
    case 0xd3:
     	printf("OUT D8	2		special");
        break;
    case 0xd4:
     	printf("CNC adr	3		if NCY, CALL adr");
        break;
    case 0xd5:
     	printf("PUSH D	1		(sp-2)<-E; (sp-1)<-D; sp <- sp - 2");
        break;
    case 0xd6:
     	printf("SUI D8	2	Z, S, P, CY, AC	A <- A - data");
        break;
    case 0xd7:
     	printf("RST 2	1		CALL $10");
        break;
    case 0xd8:
     	printf("RC	1		if CY, RET");
        break;
    case 0xd9:
     	printf("-			");
        break;
    case 0xda:
     	printf("JC adr	3		if CY, PC<-adr");
        break;
    case 0xdb:
     	printf("IN D8	2		special");
        break;
    case 0xdc:
     	printf("CC adr	3		if CY, CALL adr");
        break;
    case 0xdd:
     	printf("-			");
        break;
    case 0xde:
     	printf("SBI D8	2	Z, S, P, CY, AC	A <- A - data - CY");
        break;
    case 0xdf:
     	printf("RST 3	1		CALL $18");
        break;
    case 0xe0:
     	printf("RPO	1		if PO, RET");
        break;
    case 0xe1:
     	printf("POP H	1		L <- (sp); H <- (sp+1); sp <- sp+2");
        break;
    case 0xe2:
     	printf("JPO adr	3		if PO, PC <- adr");
        break;
    case 0xe3:
     	printf("XTHL	1		L <-> (SP); H <-> (SP+1)");
        break;
    case 0xe4:
     	printf("CPO adr	3		if PO, CALL adr");
        break;
    case 0xe5:
     	printf("PUSH H	1		(sp-2)<-L; (sp-1)<-H; sp <- sp - 2");
        break;
    case 0xe6:
     	printf("ANI D8	2	Z, S, P, CY, AC	A <- A & data");
        break;
    case 0xe7:
     	printf("RST 4	1		CALL $20");
        break;
    case 0xe8:
     	printf("RPE	1		if PE, RET");
        break;
    case 0xe9:
     	printf("PCHL	1		PC.hi <- H; PC.lo <- L");
        break;
    case 0xea:
     	printf("JPE adr	3		if PE, PC <- adr");
        break;
    case 0xeb:
     	printf("XCHG	1		H <-> D; L <-> E");
        break;
    case 0xec:
     	printf("CPE adr	3		if PE, CALL adr");
        break;
    case 0xed:
     	printf("-			");
        break;
    case 0xee:
     	printf("XRI D8	2	Z, S, P, CY, AC	A <- A ^ data");
        break;
    case 0xef:
     	printf("RST 5	1		CALL $28");
        break;
    case 0xf0:
     	printf("RP	1		if P, RET");
        break;
    case 0xf1:
     	printf("POP PSW	1		flags <- (sp); A <- (sp+1); sp <- sp+2");
        break;
    case 0xf2:
     	printf("JP adr	3		if P=1 PC <- adr");
        break;
    case 0xf3:
     	printf("DI	1		special");
        break;
    case 0xf4:
     	printf("CP adr	3		if P, PC <- adr");
        break;
    case 0xf5:
     	printf("PUSH PSW	1		(sp-2)<-flags; (sp-1)<-A; sp <- sp - 2");
        break;
    case 0xf6:
     	printf("ORI D8	2	Z, S, P, CY, AC	A <- A | data");
        break;
    case 0xf7:
     	printf("RST 6	1		CALL $30");
        break;
    case 0xf8:
     	printf("RM	1		if M, RET");
        break;
    case 0xf9:
     	printf("SPHL	1		SP=HL");
        break;
    case 0xfa:
     	printf("JM adr	3		if M, PC <- adr");
        break;
    case 0xfb:
     	printf("EI	1		special");
        break;
    case 0xfc:
     	printf("CM adr	3		if M, CALL adr");
        break;
    case 0xfd:
     	printf("-			");
        break;
    case 0xfe:
     	printf("CPI D8	2	Z, S, P, CY, AC	A - data");
        break;
    case 0xff:
     	printf("RST 7	1		CALL $38");
        break;
    }
}
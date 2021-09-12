#ifndef DISASSEMBLER_H__
#define DISASSEMBLER_H__

typedef struct
{
	char* input_file;
	char* output_file;
} arguments_t;

int Disassemble8080(unsigned char *codebuffer, int pc);

#endif
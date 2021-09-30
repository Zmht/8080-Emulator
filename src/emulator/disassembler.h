#ifndef DISASSEMBLER_H__
#define DISASSEMBLER_H__

/**
 * @brief Disassembles a binary file and outputs to stdout
 * @param filename binary file to disassemble.
 * @param outflie the file to write the disassembled code to. Default is stdout.
 * @return EXIT_FAILURE if unsucsesful, EXIT_SUCCESS if it is.
 */
int disassemble(char* filename, char* outfile);

/**
 * @brief Pass this puppy the buffer to the code, and where the opcode is, and it will print to the screen the assembly version of it.
 * @param codebuffer character pointer to buffer containing code
 * @param pc program counter that says where in the buffer you are.
 * @return opbytes used
 */
int Disassemble8080(unsigned char *codebuffer, int pc);

#endif

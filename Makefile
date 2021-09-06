CC=clang
CFLAGS=-Wall -c
DEBUGFLAGS=-g -O0
RELEASEFLAGS=-O3


disassembler: disassembler.o
	$(CC) disassembler.o -o disassembler

disassembler.o: src/Disassembler/disassembler.c
	$(CC) $(CFLAGS) $(DEBUGFLAGS) src/Disassembler/disassembler.c

cpu:


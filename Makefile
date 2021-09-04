CC=clang
CFLAGS=-Wall -c
DEBUGFLAGS=-g -O0
RELEASEFLAGS=-O3





all: disassembler cpu

disassembler: $(SRC)/Disassembler/disassembler.o

cpu:


CC=clang
CFLAGS=-Wall -c -Werror
DEBUGFLAGS=-g -O0


all: disassembler cpu ram rom display

emulator: cpu ram rom display

disassembler: disassembler.o
	rm -rf roms/invaders/invaders.s
	$(CC) obj/disassembler.o -o bin/disassembler

cpu:


ram:


rom:


display:


disassembler.o: src/Disassembler/disassembler.c
	$(CC) $(CFLAGS) $(DEBUGFLAGS) src/Disassembler/disassembler.c -o obj/disassembler.o

clean:
	rm -rf bin/* obj/*
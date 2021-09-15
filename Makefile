CC=clang
CFLAGS=-Wall -Werror
DEBUGFLAGS=-g -O0


all: emulator
	mkdir -p bin obj


emulator: cpu.o ram.o rom.o display.o
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -o bin/emulator obj/cpu.o obj/ram.o obj/rom.o obj/display.o 

cpu.o:
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -c src/cpu.c -o obj/cpu.o

ram.o:
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -c src/ram.c -o obj/ram.o

rom.o:
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -c src/rom.c -o obj/rom.o

display.o:
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -c src/display.c -o obj/display.o

clean:
	rm -rf bin/* obj/*
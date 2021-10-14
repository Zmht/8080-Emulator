# 8080-Emulator

This is my program to emulate a Intel 8080 CPU. The Intel 8080 was created in the 1970s and sported 8-bit data sizes and up to 64 Kilobytes of memory. My emulator has a shell that you can use to provide the instruction that you want the cpu to run and then shows you the update state of the cpu. It is written in the C programming language and contains over 3000 lines of code.

## Features:
- Disassembler: You can generate a disassembled version of a compiled binary
- Emulator: Emulate single instructions in a simple shell like enviornment

## Run & Build:
### Linux/Mac Build Instructions:
- Ensure you have a C compiler and the "make" build tool (these should be installed by default on MacOS
- Download the code using git or by pasting the command `curl -LJO https://github.com/Zmht/8080-Emulator/archive/refs/heads/master.zip` into a terminal
- Unzip the zip file by double clicking it in finder.
- open a terminal in the new directory by right clicking on it and selecting "New Terminal at Folder"
- run the `make` command to compile.

### Run the Emulator:
- Type `./bin/zemulator` into the command line from the projects directory
- you can use the `inst` command in my program to open a shell the allows you to run a command 
   - type in the hexadecimal operation code for the instruction that you want run on the cpu. A list of all 255 can be found [here](https://pastraiser.com/cpu/i8080/i8080_opcodes.html).
   - the format is `op d1 d2` where `op` means the operation code and `d1 d2` are the first and second immideate values (if there are none then just put 00 00)
   - to exit the emulator use the ctrl-c key combination.

## Examples:
Because I know the the instructions for compiling and running the program are rather complex I will provide some examples of the emulator in action right here for anyone who is interested. You will see the actual output from the program under each example and will be able to observe the changes in state of the CPU for your self.

### MVI A,d1
The MVI instruction is an assembly instruction that loads a 8-bit (one byte) value (d1) into the A register of the computer. This is an espceeially important instruction because the A register is also the 8008's accumulator and many math related instructions use it. When we look at the opcode table linked above, we can see that the hexadecimal value for MVI, A is 3e. Lets say that we want to load the hexadecimal value of 0x24. The assembley for that is `MVI A, 24`. We can enter that into my shell: `0e 24 00` remember, 24 is a hex value so in the base-10 number system it is 36.
```
INS: E
	B: 0, C: 0
	D: 0, E: 0
	H: 0, L: 0
	A: 24 PC: 0, SP:0
       carry: 0, aux: 0, parity: 0, sign: 0, zero: 0
   ```

### RLC
The RLC instruction rotatates the data in the accumulator (thats the A register and the one we just loaded with 0x24) to the left. The binary version of 0x24 is 00100100. When that is rotated to the left, it will look like 01001000. The hex value of that is 0x48 and that is what should show up in our A register after running our instruction: `07 00 00`.
```
INS: 7
	B: 0, C: 0
	D: 0, E: 0
	H: 0, L: 0
	A: 48 PC: 0, SP:0
       carry: 0, aux: 0, parity: 0, sign: 0, zero: 0
   ```

### INR A
INR A is an instruction that increments the A register (also the accumulator). Right now, the A register is holding the value of 0x48 and incrementing it by one should have it hold the value of 0x49. The opcode for INR A is 3c. We can type it in: `3c 00 00`. The A register now holds 0x49!
```
INS: 3C
	B: 0, C: 0
	D: 0, E: 0
	H: 0, L: 0
	A: 49 PC: 0, SP:0
       carry: 0, aux: 0, parity: 0, sign: 0, zero: 0
   ```

### MOV B,A
The MOV A,B instruction will copy the value of the A register (now holding 0x49) to the B register. The hex opcode of MOV B,A is 0x47, so typing `47 00 00` into the shell should do the trick.
```
INS: 47
	B: 49, C: 0
	D: 0, E: 0
	H: 0, L: 0
	A: 49 PC: 0, SP:0
       carry: 0, aux: 0, parity: 0, sign: 0, zero: 0
   ```

# My Notes on the Intel 8080:
These are some notes I took about the general architecture of the Intel 8080, with information from the official Intel 8080 datasheet and programmers manual.

## Registers:
- All registers are 8 bits wide and are where data ops happen.
- Numbered and lettered: 0,1,2,3,4,5,7 and B,C,D,E,H,L,A
- Registers are paired for some instructions:
    ```
    B = B & C
    D = D & E
    H = H & L
    PSW = Program status word. A register and special byte in memory
    ```
## Memory:
- Works with ROM, RAM, and Programable ROM
- Memory can go from 0-FFFF

## Program Counter:
- 16 bit register
- contents tell the address of next instruction

## Stack Pointer:
- stack is an area of memory that the programmer sets aside
- 16 bit accesible register

## Memory Adressing:
- Direct Adressing is supplying the memory address that you want to address with a literal (provide location in command)
- Register Pair Addresing is specifying a register pair that contains the 16 bit address. This has to be done with the H register pair with H holding the most significant byte and L the least.
- Stack Pointer Adressing is addressing data with the 16 bit stack pointer
    - Push Operation: Most significant bits are stored at location one less than the location of stack pointer, least are 2 away. Then the stack pointer is decremented by two.
    - Pop Operation: least significant digits loaded, most sig are loaded at adress one greater than stack pointers, SP is incremented by 2.

## Condition Bits:
- 8080 has 5 condition bits
- All but one can be tested in code with instructions
- Carry Bit:
   - Carry bit is affected by addition, subtraction, rotate and logical operations
- Aux. Carry Bit:
   - not very important but ifi you must know it is set when there is a carry out of bit 3.
- Sign Bit:
   - Set when the 7th bit is 1, 0 when it is 0
- Zero Bit:
   - Set when the sum of a operation is 0
- Parity Bit:
   - Set when the number of 1 bits is odd

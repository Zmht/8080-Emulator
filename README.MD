# 8080-Emulator

This is my program to emulate a Intel 8080 CPU. The Intel 8080 was created in the 1970s and sported 8-bit data sizes and up to 64 Kilobytes of memory. My emulator has a shell that you can use to provide the instruction that you want the cpu to run and then shows you the update state of the cpu. It is written in the C programming language and contains over 2000 lines of code.

## Features:
- Disassembler: You can generate a disassembled version of a compiled binary
- Emulator: Emulate single instructions in a simple shell like enviornment

## Run & Build:
### Linux/Mac Build Instructions:
- Ensure you have a C compiler and the "make" build tool (these should be installed by default on MacOS
- Download the code using git or by pasting the command ```curl -LJO https://github.com/Zmht/8080-Emulator/archive/refs/heads/master.zip``` into a terminal
- Unzip the zip file by double clicking it in finder.
- open a terminal in the new directory by right clicking on it and selecting "New Terminal at Folder"
- run the ```make``` command to compile.

### Run the Emulator:
- Type ```./bin/zemulator``` into the command line from the projects directory
- you can use the ```inst``` command in my program to open a shell the allows you to run a command 
   - type in the hexadecimal operation code for the instruction that you want run on the cpu. A list of all 255 can be found [here](https://pastraiser.com/cpu/i8080/i8080_opcodes.html).
   - the format is ```op d1 d2``` where ```op``` means the operation code and ```d1 d2``` are the first and second immideate values (if there are none then just put 00 00)

## Examples:
Because I know the the instructions for compiling and running the program are rather complex I will provide some examples of the emulator in action right here for anyone who is interested.

### MVI A,d1
The MVI instruction is an assembly instruction that loads a 8-bit (one byte) value (d1) into the A register of the computer. This is an espceeially important instruction because the A register is also the 8008's accumulator and many math related instructions use it. When we look at the opcode table linked above, we can see that the hexadecimal value for MVI, A is 3e. Lets say that we want to load the hexadecimal value of 0x24. The assemble for that is ```MVI A, 24```. We can enter that into my shell: ```0e 24 00``` remember, 24 is a hex value so in the base-10 number system it is 36.

### RLC
The RLC instruction rotatates the data in the accumulator (thats the A register and the one we just loaded with 0x24) to the left. The binary version of 0x24 is 00100100. When that is rotated to the left, it will look like 01001000. The hex value of that is 0x48 and that is what should show up in our A register after running our instruction: ```07 00 00```.

### INR A
INR A is an instruction that increments the A register (also the accumulator). Right now, the A register is holding the value of 0x48 and incrementing it by one should have it hold the value of 0x49. The opcode for INR A is 3c. We can type it in: ```3c 00 00```. The A register now holds 0x49!


### MOV B,A
The MOV A,B instruction will copy the value of the A register (now holding 0x49) to the B register. The hex opcode of MOV B,A is 0x47, so typing ```47 00 00``` into the shell should do the trick.

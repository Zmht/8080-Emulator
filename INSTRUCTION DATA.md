# Intel 8080

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
- Memory can go from 0-FFFFH

## Program Counter:
- 16 bit register
- contents tell the address of next instruction

## Stack Pointer:
- stack is an area of memory that the programmer sets aside
- 16 bit accesible register

## Memory Adressing:
- Direct Adressing is supplying the memory address that you want to address with a literal (provide location in command)
- Register Pair Addresing is specifying a register pair that contains the 16 bit address. This has to be done with the H register pair with H holding the most significant byte and L the least.


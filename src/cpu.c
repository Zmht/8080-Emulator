/************************************************************************
 * File: cpu.c                                                          *
 * Author: Zachary Hansen Terry                                         *
 * Description: Emulates the basic state and functionality of the       *
 * Intel 8080 CPU                                                       *
 ***********************************************************************/

#include "cpu.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct
{
    uint8_t A;
    uint8_t F;

    uint8_t B;
    uint8_t C;

    uint8_t D;
    uint8_t E;

    uint8_t H;
    uint8_t L;

} register_8080;

uint16_t adress_bus;
uint16_t data_bus;

uint32_t stack_pointer;
uint32_t program_counter;

register_8080 registers_8080;


int init_cpu(void)
{
    program_counter = 0;    //Code execution starts at memory location 0x00
    if(program_counter == 0)
        return 0;
    else
    {
        printf("CPU Init Error\n");
        return 1;
    }
}


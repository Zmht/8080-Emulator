/**
 * cpu.h
 * Description: State of the CPU and its properties
 * Author: Zachary Hansen Terry
 */
#ifndef _CPU_H_
#define _CPU_H_

#include "emu.h"

int init_cpu(cpu_8080* cpu);
int exec_instruction(cpu_8080* cpu);

#endif


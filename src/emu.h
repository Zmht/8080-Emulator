#ifndef _EMU_H_
#define _EMU_H_

typedef struct
{
    int     disassemble     : 1;
    int     emulate         : 1;
    int     verbose         : 1;
    int     shell           : 1;
    char*   in_file;
}options_t;

#endif
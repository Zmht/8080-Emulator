/**
 * File: emu.c
 * Author: Zachary Hansen Terry
 * Description: This is an emulator for my computer setup. It uses the cpu, rom, ram, display, and clock together to make a computer.
 */


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <libgen.h>
#include <errno.h>
#include <string.h>
#include <getopt.h>
#include <stdint.h>

#define OPSTRING "o:i:h:d"
#define USAGE_FMT "%s [-v] [-i inputfile] [-d outputfile] [-h]"

extern int errno;
extern char* optarg;
extern int operr;
extern int optind;

typedef struct
{
    int     disassemble     : 1;
    int     verbose         : 1;
    FILE    *in_file;
}options_t;

void usage(int opt);

int main(int argc, char** argv)
{
    options_t options = {0, 0, stdin};
    int opt;
    opterr = 0;

    while ((opt == getopt(argc, argv, OPSTRING)) != EOF)
    {
        switch (opt)
        {
        case 'd':       //Disassemble
            options.disassemble = 1;
            break;
        
        case 'v':       //Verbose
            options.verbose = 1;
            break;

        case 'i':
            if ((options.in_file = fopen(optarg, "rb")) == 0)
            {
                perror("Error: Could not open file");
                return EXIT_FAILURE;
            }
            break;

        case 'h':
            usage(opt);
            break;
        }
    }
    
    return EXIT_SUCCESS;
}

void usage(int opt)
{
    printf("Test");
}
/**
 * File: emu.c
 * Author: Zachary Hansen Terry
 * Description: This is an emulator for my computer setup. It uses the cpu, rom, ram, display, and clock together to make a computer.
 */

#include "shell.h"
#include "disassembler.h"
#include "emu.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <libgen.h>
#include <errno.h>
#include <string.h>
#include <getopt.h>
#include <stdint.h>

#define OPTSTRING "i:dsvh"
#define USAGE_FMT "\033[31m%s\033[0m [-i inputfile] [-d] [-s] [-v] [-h]\n\
\t-i <inputfile>: the binary file that you want emulated\n\
\t-d: disassemble the inputfile instead of emulating it\n\
\t-s: use the emulators shell\n\
\t-v: verbosity\n\
\t-h: help\n"

extern int errno;
extern char* optarg;
extern int operr;
extern int optind;

void usage(char *progname);
void emulate(options_t* options);


int main(int argc, char** argv)
{
    options_t options = {0, 1, 0, 0};
    int opt;
    opterr = 0;

    if (argc <= 1)
    {
        usage(argv[0]);
    }

    while ((opt = getopt(argc, argv, OPTSTRING)) != EOF)
    {
        switch (opt)
        {
        case 'i':
            options.in_file = optarg;
            break;

        case 'd':       //Disassemble
            options.emulate = 0;
            options.disassemble = 1;
            break;

        case 's':
            options.shell = 1;
            break;
        
        case 'v':       //Verbose
            options.verbose = 1;
            break;

        case 'h':
            usage(argv[0]);
            break;

        default:
            usage(argv[0]);
            break;
        }
    }

    emulate(&options);
    
    return EXIT_SUCCESS;
}

void usage(char *progname)
{
    fprintf(stderr, USAGE_FMT, progname);
    exit(EXIT_FAILURE);
}

void emulate(options_t* options)
{
    if(options->disassemble)
    {
        if((disassemble(options->in_file)) == EXIT_FAILURE)
        {
            exit(EXIT_FAILURE);
        }
        exit(EXIT_SUCCESS);
    }

    if(options->shell)
    {
        shell(options);
    }
    

    

    
    
}

#include "shell.h"
#include "disassembler.h"
#include "emu.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char** argv)
{
    if(shell() != EXIT_SUCCESS)    //Starts the shell and tests the return value
    {
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}

#include "shell.h"
#include "shell.h"

#include <stdio.h>

void prompt();
int process();

int shell(options_t* options)
{
    prompt();
    return 0;
}

void prompt()
{
    printf("\033[0;32m [zemulator] ");
}
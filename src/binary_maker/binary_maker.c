#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
    FILE* out_file;

    if(argc == 3)
    {
        out_file = fopen(argv[2], "wb");
    }
    else
    {
        out_file = fopen("test.rom", "wb");
    }
    if(out_file == NULL)
    {
        printf("Could not open output file");
        exit(EXIT_FAILURE);
    }

    int in = atoi(argv[1]);

    fwrite(&in, sizeof(in), 1, out_file);
    fclose(out_file);
    
    return 0;
}

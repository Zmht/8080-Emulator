#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
    FILE* out_file = fopen("test.rom", "wb");
    if(out_file == NULL)
    {
        printf("Could not open output file");
        exit(EXIT_FAILURE);
    }

    fwrite(argv[1], sizeof(char), strlen(argv[1]), out_file);
    fclose(out_file);
    
    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LEN 1024

int main () {
    char line [MAX_LINE_LEN];
    FILE *in = fopen ("a", "r");
    if (!in) exit (EXIT_FAILURE);
    while (fgets(line, MAX_LINE_LEN, in) != NULL) {
        char *sep = strchr(line , ':');
        if (!sep) exit (EXIT_FAILURE);
        *sep = '\0';
        printf("%s\n", line);
    }
    fclose(in);
    return EXIT_SUCCESS ;
}

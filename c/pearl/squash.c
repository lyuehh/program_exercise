#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, const char *argv[])
{
    char word[100], sig[100], oldsig[100];
    int linenum = 0;
    strcpy(oldsig, "");
    while (scanf("%s %s", sig, word) == 2) {
        if (strcmp(oldsig, sig) != 0 && linenum > 0) {
            printf("\n");
        }
        strcpy(oldsig, sig);
        linenum++;
        printf("%s ", word);
    }
    printf("\n");
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int cmp(const void *_a, const void *_b) {
    char *a = (char *)_a;
    char *b = (char *)_b;
    return *a - *b;
}

int main(int argc, const char *argv[])
{
    char s1[100], s2[100];
    while (scanf("%s", s1) == 1) {
        strcpy(s2, s1);
        qsort(s2, strlen(s2), sizeof(char), cmp);
        printf("%s %s\n", s2, s1);
    }
    return 0;
}

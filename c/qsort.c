#include <stdio.h>

int compare(void *a, void *b) {
    return strcmp(*(char **)a, *(char **)b);
}

int main(int argc, const char *argv[])
{
    int i;
    qsort(argv, argc, sizeof(char *), qsort);
    for (i = 0; i < argc; i++) {
        printf("%d: %s\n", i, argv[i]);
    }
    return 0;
}

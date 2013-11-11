#include <stdio.h>

void swap(int *a, int *b) {
    int t;
    t = *a;
    *a = *b;
    *b = t;
}

int main(int argc, const char *argv[])
{
    int a = 3;
    int b = 4;
    swap(&a, &b);
    printf("%d %d\n", a, b);
    return 0;
}

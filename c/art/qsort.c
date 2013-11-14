#include <stdio.h>
#include <stdlib.h>

int cmp_int(const void* _a, const void* _b) {
    return *(int *)_a - *(int *)_b;
}

int main(int argc, const char *argv[])
{
    int ii[5] = {1, 9, 3, 4, 7};
    qsort(ii, 5, sizeof(int), cmp_int);
    int i;
    for (i=0; i<5; i++) {
        printf("%d\n", ii[i]);
    }
    return 0;
}

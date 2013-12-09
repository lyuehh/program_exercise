#include <stdio.h>
#include <stdlib.h>

int cmp(const void *a, const void *b) {
    int *_a = (int *)a;
    int *_b = (int *)b;
    return *_a - *_b;
}

int a[100000000];
int main(int argc, const char *argv[])
{
    int n = 0;
    int i;
    while(scanf("%d", &a[n]) != EOF) {
        n++;
    }
    qsort(a, n, sizeof(int), cmp);
    for (i=0; i<n; i++) {
        printf("%d\n", a[i]);
    }
    return 0;
}

#include <stdio.h>
#include <string.h>

#define MAX 100
int a[MAX];

int main(int argc, const char *argv[])
{
    int n, i = 0;
    int max;
    memset(a, 0, sizeof(a));

    while(scanf("%d", &n) != EOF) {
        a[n]++;
    }
    max = 0;
    for (i=0; i<100; i++) {
        if (a[i] >= max) {
            max = a[i];
        }
    }
    for (i=0; i<100; i++) {
        if (a[i] == max) {
            printf("%d\n", i);
        }
    }
    return 0;
}

#include <stdio.h>
#include <string.h>
#define MAX 100 + 10
int a[MAX];

int main(int argc, const char *argv[])
{

    // memcpy(b, a, sizeof(int) * k);
    // memcpy(b, a, sizeof(double) * k);
    // memcpy(b, a, sizeof(a));
    int i, x, n = 0;
    while (scanf("%d", &x) == 1) {
        a[n++] = x;
    }
    for (i=n-1; i>= 1; i--) {
        printf("%d ", a[i]);
    }
    printf("%d\n", a[0]);
    return 0;
}

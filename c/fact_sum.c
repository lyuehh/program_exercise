#include <stdio.h>
#include <time.h>

int main(int argc, const char *argv[])
{
    const int m = 1000000;
    int i, j, n, s = 0;
    scanf("%d", &n);
    for (i = 1; i <= n; i++) {
        if (n > 25) n = 25;
        int factorial = 1;
        for (j = 1; j <= i; j++) {
            factorial = factorial * j % m;
        }
        s += factorial;
    }
    printf("%d\n", s % m);
    printf("Time used = %.2lf\n", (double)clock() / CLOCKS_PER_SEC);
    return 0;
}

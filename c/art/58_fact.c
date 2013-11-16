#include <stdio.h>
#include <string.h>
#include <math.h>

int is_prime(int n) {
    int i;
    for (i=2; i<=sqrt(n+0.5); i++) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int prime[100], count = 0;

int main(int argc, const char *argv[])
{
    int n, p[100]; // n和各个素数的指数
    int i;

    // 构造素数表
    for (i=2; i<= 100; i++) {
        if (is_prime(i)) prime[count++] = i;
    }

    for (i=0; i<= 100; i++) {
        printf("%d\n", prime[i]);
    }

    while (scanf("%d", &n) == 1) {
        printf("%d! =", n);
        memset(p, 0, sizeof(p));
        int maxp = 0;

        for (i=1; i<=n; i++) {
            int m = i;
            int j;
            for (j=0; j<count; j++) {
                while (m % prime[j] == 0) {
                    m /= prime[j];
                    p[j]++;
                    if (j > maxp) maxp = j;
                }
            }
        }

        for (i=0; i<=maxp; i++) {
            printf(" %d", p[i]);
        }
        printf("\n");
    }
    return 0;
}

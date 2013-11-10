#include <stdio.h>
#include <math.h>
#include <assert.h>

int is_prime(int x)
{
    int i;
    assert(x >= 0);
    if (x == 1) return 0;
    int m;
    m = floor(sqrt(x) + 0.5);
    for (i=2; i<=m; i++) {
        if (x % i == 0) return 0;
    }
    return 1;
}

int main(int argc, const char *argv[])
{
    int i, m;
    scanf("%d", &m);

    for (i=m; i>=3; i--) {
        if (is_prime(i) && is_prime(i-2)) {
            printf("%d %d\n", i-2, i);
            break;
        }
    }

    /* for (i=m-2; i>=3; i--) { */
    /*     if (is_prime(i) && is_prime(i+2)) { */
    /*         printf("%d %d\n", i, i+2); */
    /*         break; */
    /*     } */
    /* } */

    return 0;
}

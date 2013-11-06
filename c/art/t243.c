#include <stdio.h>
#include <math.h>

int main(int argc, const char *argv[])
{
    long long n, i;
    int count;
    scanf("%lld", &n);
    /* printf("%lld\n", n); */
    for (i=1; i<(long long)ceil(sqrt(n)); i++) {
        if (n % i == 0) {
            count++;
        }
    }
    printf("%d\n", count*2);
    return 0;
}

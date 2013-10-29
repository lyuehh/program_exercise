#include <stdio.h>
/*
 * 2013-10-29 20:18
 * */


int main(int argc, const char *argv[])
{
    long long n, count = 0;
    scanf("%lld", &n);
    while (n > 1) {
        if (n % 2 == 1) {
            n = n * 3 + 1;
        } else {
            n /= 2;
        }
        count++;
    }
    printf("%lld\n", count);
    return 0;
}

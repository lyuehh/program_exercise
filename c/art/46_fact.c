#include <stdio.h>

long long f(int n) {
    return n == 0 ? 1 : f(n-1) * n;
}

int main(int argc, const char *argv[])
{
    int n;
    scanf("%d", &n);
    printf("%lld\n", f(n));
    return 0;
}

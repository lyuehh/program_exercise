#include <stdio.h>
#include <math.h>

int main(int argc, const char *argv[])
{
    int x, n, hi, lo;
    for(x = 1; ; x++) {
        n = x * x;
        if (n < 1000) continue;
        if (n > 9999) break;
        hi = n / 100; // 前2位
        lo = n % 100; // 后2位
        if (hi / 10 == hi % 10 && lo / 10 == lo % 10)
            printf("%d\n", n);
    }

    {
        int a, b, n;
        double m;
        for (a=1; a<=9; a++) {
            for(b=0; b<=9; b++) {
                n = a * 1100 + b * 11;
                m = sqrt(n);
                if (floor(m + 0.5) == m)
                    printf("%d\n", n);
            }
        }
    }
    return 0;
}

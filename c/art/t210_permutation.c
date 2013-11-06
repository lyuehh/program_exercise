#include <stdio.h>

int main(int argc, const char *argv[])
{
    int i, j, k;
    int a[10] = {0};
    for (i=100; i<=333; i++) {
        j = i * 2;
        k = i * 3;

        a[i/100] = a[i/10%10] = a[i%10] = 1;
        a[j/100] = a[j/10%10] = a[j%10] = 1;
        a[k/100] = a[k/10%10] = a[k%10] = 1;
        int s = 0;
        int ii;
        for (ii=1; ii<=9; ii++) {
            s += a[ii];
        }
        if (s == 9) {
            printf("%d %d %d\n", i, j, k);
        }
        for (ii=1; ii<=9; ii++) {
            a[ii] = 0;
        }

    }
    return 0;
}

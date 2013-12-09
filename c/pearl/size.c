#include <stdio.h>
#include <math.h>

int main(int argc, const char *argv[])
{
    long n;
    /* scanf("%d", &n); // 10, 100, 1000 */
    while (scanf("%ld", &n) == 1) {
        int size = 0;
        while ((n=n/10)) {
            size++;
        }
        int size_bak = size;
        int i, j = 2;
        long ret = 0;
        for (i=0; i<size; i++, j++) {
            ret += 9 * pow(10, i) * j;
        }
        ret += (size_bak + 2);
        printf("%ld\n", ret);
    }

    return 0;
}

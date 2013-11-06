#include <stdio.h>


int main(int argc, const char *argv[])
{
    freopen("avg.in", "r", stdin);
    freopen("avg.out", "w", stdout);

    int x, n = 0, min, max, s = 0;
    scanf("%d", &x);
    min = max = x;
    while (scanf("%d", &x) == 1) {
        s += x;
        if (x < min) {
            min = x;
        }
        if (x > max) {
            max = x;
        }
        n++;
    }
    printf("%d %d %.3f\n", min, max, (double)s/n);
    return 0;
}

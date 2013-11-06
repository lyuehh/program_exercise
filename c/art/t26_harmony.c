#include <stdio.h>

int main(int argc, const char *argv[])
{
    int n;
    scanf("%d", &n);
    int i;
    double sum = 0.0;
    for (i=1; i<=n; i++) {
        sum += (double)1/i;
    }
    printf("%.3f\n", sum);
    return 0;
}

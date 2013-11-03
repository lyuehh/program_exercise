#include <stdio.h>

int main(int argc, const char *argv[])
{
    long long i = 1;
    double sum = 0.0;
    int n, m; // n < m
    scanf("%d %d", &n, &m);

    for (i=n; i<=m; i++) {
        sum += (double)1/(i*i);
    }

    printf("%.5f\n", sum);
    return 0;
}

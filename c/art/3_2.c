#include <stdio.h>

int main(int argc, const char *argv[])
{
    int min, max, avg, count, n, sum;
    scanf("%d", &n);
    min = max = sum = n;
    count = 1;
    while(scanf("%d", &n) == 1) {
        if (n < min) {
            min = n;
        }
        if (n > max) {
            max = n;
        }
        count++;
        sum += n;
    }
    printf("min: %d, max: %d, avg: %d", min, max, sum/count);

    return 0;
}

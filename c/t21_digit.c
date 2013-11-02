#include <stdio.h>

int main(int argc, const char *argv[])
{
    int n;
    int d = 1;
    scanf("%d", &n);
    while (n > 10) {
        n = n / 10;
        d++;
    }
    printf("%d\n", d);
    return 0;
}

#include <stdio.h>

int main(int argc, const char *argv[])
{
    int i, n;
    scanf("%d", &n);

    for (i=2; i<=n*2; i+=2) {
        printf("%d\n", i);
    }

    for (i=1; i<=n; i++) {
        printf("%d\n", i*2);
    }
    return 0;
}

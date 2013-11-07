#include <stdio.h>
#include <string.h>

/* easy version, not fulfil the question */
int main(int argc, const char *argv[])
{
    long long product = 1;
    long x;
    int a;
    scanf("%d", &a);
    while (scanf("%ld", &x) != EOF) {
        product *= x;
    }
    long ret = product % 1000;
    if (ret < 100) {
        printf("0");
    }
    printf("%ld\n", ret);
    return 0;
}

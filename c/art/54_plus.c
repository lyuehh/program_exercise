#include <stdio.h>

int main(int argc, const char *argv[])
{
    int a, b;
    int count = 0;
    while (scanf("%d %d", &a, &b) == 2) {
        if (a == 0 && b == 0) {
            break;
        }
        int i;
        for (i=0; i<=9; i++) {
            int c = 0;
            c = (a % 10 + b % 10 + c) > 9 ? 1 : 0; // 每次的最后2个之和加上上次的进位
            count += c;
            a /= 10;
            b /= 10;
        }
        printf("%d\n", count);
        /* printf("%d %d\n", a, b); */
    }
    return 0;
}

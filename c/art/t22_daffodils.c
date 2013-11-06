#include <stdio.h>

int main(int argc, const char *argv[])
{
    int n;
    /* scanf("%d", &n); */
    /* printf("%d\n", n); */
    int i;
    int a, b, c;
    for (i=100; i<999; i++) {
        a = i / 100; // 百位
        b = i % 100 / 10; // 十位
        c = i % 100 % 10; // 个位
        if ((a*a*a + b*b*b + c*c*c) == i) {
            printf("%d\n", i);
        }
    }
    return 0;
}

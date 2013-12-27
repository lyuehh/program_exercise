#include <stdio.h>

/* x/y = q...r */
/* 3/2 = 1...1 */
void div(int x, int y, int *q, int *r) {
    printf("x: %d\n", x);
    printf("y: %d\n", y);
    /* *r = x, *q = 0; */
    /* int r1 = x, q1 = 0; */
    int r1 = x, q1 = 0;
    printf("r1: %d\n", r1);
    while (r1 >= y) {
        printf("111\n");
        r1 = r1 - y; // 1
        q1 = q1 + 1; // 1
        printf("222\n");
    }
}

int main(int argc, const char *argv[])
{
    int *a, *b;
    div(3, 2, a, b);
    printf("a = %d, b = %d\n", *a, *b);
    return 0;
}

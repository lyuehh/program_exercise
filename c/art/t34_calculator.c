#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[])
{
    int a, b;
    char s;
    int r;
    scanf("%d %c %d", &a, &s, &b);
    if (s == '+') {
        r = a + b;
    } else if (s == '-') {
        r = a - b;
    } else if (s == '*') {
        r = a * b;
    } else {
        printf("ERROR!!\n");
        return 1;
    }
    printf("%d\n", r);
    return 0;
}

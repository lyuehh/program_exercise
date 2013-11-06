#include <stdio.h>

int main(int argc, const char *argv[])
{
    double r;
    int a, b, c;
    scanf("%d %d %d", &a, &b, &c);
    r = (double)a/b;
    printf("%.*lf\n", c, r);
    return 0;
}

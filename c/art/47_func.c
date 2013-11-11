#include <stdio.h>
 #include <time.h>

int f()
{
    int a;
    return a;
}

int g()
{
    int b;
    return b;
}

int h() {
    int c;
    return c;
}

int main(int argc, const char *argv[])
{
    int a, b;
    a = f();
    b = f();
    printf("%d %d\n", a, b);
    return 0;
}

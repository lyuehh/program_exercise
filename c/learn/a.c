#include <stdio.h>

int main(int argc, const char *argv[])
{
    printf("%ld\n", sizeof(short));
    printf("%ld\n", sizeof(unsigned short));
    printf("%d\n", -65534 % 3);
    return 0;
}

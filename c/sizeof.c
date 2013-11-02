#include <stdio.h>

int main(int argc, const char *argv[])
{
    printf("char: %lu\n", sizeof(char));
    printf("int: %lu\n", sizeof(int));
    printf("float: %lu\n", sizeof(float));
    printf("long: %lu\n", sizeof(long));
    printf("long long:%lu\n", sizeof(long long));
    printf("double: %lu\n", sizeof(double));
    return 0;
}

#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[])
{
    char *c = strchr("asdf", 's');
    char *c2 = strchr("asdf", 'x');

    printf("%s\n", c);
    printf("%s\n", c2);
    return 0;
}

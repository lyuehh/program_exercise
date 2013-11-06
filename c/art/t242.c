#include <stdio.h>

int main(int argc, const char *argv[])
{
    double i;
    for (i=0; i!=10; i+=0.1) {
        printf("%.1lf\n", i);
    }
    return 0;
}

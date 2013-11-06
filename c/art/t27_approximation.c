#include <stdio.h>

int main(int argc, const char *argv[])
{
    int i = 1;
    int flag = 1;
    double sum = 0.0;
    for (i=1; (double)1/i > 0.00000001; i+=2) {
        if (flag) {
            sum += (double)1/i;
            flag = 0;
        } else {
            sum -= (double)1/i;
            flag = 1;
        }
    }
    printf("%.9f\n", sum * 4);
    return 0;
}

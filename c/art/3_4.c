#include <stdio.h>
#include <string.h>
#include <math.h>
#define MAX 1000
int a[MAX];

int main(int argc, const char *argv[])
{
    int c;
    int count = 1;
    int i;
    int digit;
    int ret;
    memset(a, -1, sizeof(a));
    c = getchar();
    a[0] = c;
    while(c != -1) {
        c = getchar();
        a[count] = c;
        count++;
    }
    digit = count - 3;
    ret = 0;
    i = 0;
    while (digit >= 0) {
        ret += (a[i] - 48) * (int)pow(10, digit);
        digit--;
        i++;
    }
    printf("%d\n", ret);
}

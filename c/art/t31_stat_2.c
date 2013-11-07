#include <stdio.h>
#include <string.h>

#define MAX 1000
int a[MAX];


int main(int argc, const char *argv[])
{
    memset(a, -1, sizeof(a));
    int n;
    int i = 0;

    while(scanf("%d", &n) == 1) {
        a[i] = n;
    }
    return 0;
}

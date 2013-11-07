#include <stdio.h>
#include <string.h>

#define MAX 10000 + 10
int a[MAX];


int main(int argc, const char *argv[])
{
    memset(a, 0, sizeof(a));
    float f;
    int i = 0;
    int max = 0;

    while(scanf("%f", &f) == 1) {
        int n = f * 100;
        a[n]++;
    }
    for (i=0; i<MAX; i++) {
        if (a[i] > max) {
            max = a[i];
        }
    }
    for (i=0; i<MAX; i++) {
        if (a[i] == max) {
            printf("%.2f ", i / 100.0);
        }
    }
    return 0;
}

#include <stdio.h>

int main(int argc, const char *argv[])
{
    int max1, max2; // 第1大，第2大
    int n1, n2;
    int n;
    scanf("%d", &n1);
    scanf("%d", &n2);
    if(n1 > n2) {
        max1 = n1;
        max2 = n2;
    } else {
        max1 = n2;
        max2 = n1;
    }

    while(scanf("%d", &n) == 1) {
        if (n > max1) {
            max2 = max1;
            max1 = n;
        } else if(n > max2) {
            max2 = n;
        }
    }
    printf("max1: %d, max2: %d\n", max1, max2);

    return 0;
}

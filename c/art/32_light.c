#include <stdio.h>
#include <string.h>

#define MAX 1000 + 10
int a[MAX];

int main(int argc, const char *argv[])
{
    int n, k;
    int i, j;
    int first = 1;
    memset(a, 0, sizeof(a));
    scanf("%d %d", &n, &k);
    /* printf("%d %d\n", n, k); */

    /* for (i=1; i<=k; i++) { // 人 */
    /*     for (j=1; j<=n; j++) { // 灯 */
    /*         if (j % i == 0) { */
    /*             a[j] = !a[j]; */
    /*         } */
    /*     } */
    /* } */

    // 先循环灯还是先循环人没区别，反正每个灯，每个人都会测试到
    // 只要等可以整除人，那么取反就可以了
    // 倍数可以用能否整除来表示
    for (i=1; i<=n; i++) { // 灯
        for (j=1; j<=k; j++) { // 人
            if (i % j == 0) {
                a[i] = !a[i];
            }
        }
    }

    for (i=1; i<=n; i++) {
        if (a[i]) {
            if (first) {
                first = 0;
            } else {
                printf(" ");
            }
            printf("%d", i);
        }
    }
    printf("\n");

    return 0;
}

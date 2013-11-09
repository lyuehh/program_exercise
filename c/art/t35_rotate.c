#include <stdio.h>
#include <string.h>

#define MAX 1000
char a[5][5] = {
    {1,2,3,4,5},
    {6,7,8,9,10},
    {11,12,13,14,15},
    {16,17,18,19,20},
    {21,22,23,24,25}
};
char b[5][5];

int main(int argc, const char *argv[])
{
    int i, j;
    int n = 5;
    for (i=0; i<n; i++) {
        for (j=0; j<n; j++) {
            printf("%2d ", a[i][j]);
            if (j == 4) {
                printf("\n");
            }
        }
    }
    printf("-----\n");
    /*
    // 保存第1排的
    for (i=0; i<n; i++) {
        b[i] = a[0][i];
    }
    // 最右竖着一排到第1排
    for (i=0; i<n; i++) {
        a[0][i] = a[i][n-1];
    }
    // 最下一排到最右一排
    for (i=0; i<n; i++) {
        a[i][n-1] = a[n-1][n-i-1];
    }
    // 最左一排到最下
    for (i=0; i<n; i++) {
        a[n-1][n-i-1] = a[n-i-1][0];
    }
    // 把保存的最上放到最左
    for (i=0; i<n; i++) {
        a[i][0] = b[n-i-1];
    }
    */

    for (i=0; i<n; i++) {
        for (j=0; j<n; j++) {
            b[i][j] = a[j][n-i-1];
        }
    }
    printf("-----\n");
    for (i=0; i<n; i++) {
        for (j=0; j<n; j++) {
            printf("%2d ", b[i][j]);
            if (j == 4) {
                printf("\n");
            }
        }
    }
    return 0;
}

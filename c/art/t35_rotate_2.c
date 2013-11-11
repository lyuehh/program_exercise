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

    for (i=0; i<n; i++) {
        for (j=0; j<n; j++) {
            b[i][j] = a[n-j-1][i]; // 向右旋转90°
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

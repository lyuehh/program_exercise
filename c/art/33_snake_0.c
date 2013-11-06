#include <stdio.h>
#include <string.h>

#define MAX 10
int a[MAX][MAX];

int main(int argc, const char *argv[])
{
    int n, x, y, tot = 0;
    scanf("%d", &n);
    int count;
    memset(a, 0, sizeof(a));
    tot = a[x=0][y=0] = 1;

    while (tot < n*n) {
        printf("tot: %d\n", tot);
        count++;
        while (y+1<n && !a[x][y+1]) a[x][++y] = ++tot;
        while (x+1<n && !a[x+1][y]) a[++x][y] = ++tot;
        while (y-1>=0 && !a[x][y-1]) a[x][--y] = ++tot;
        while (x-1>=0 && !a[x-1][y]) a[--x][y] = ++tot;
    }

    for (x=0; x<n; x++) {
        for (y=0; y<n; y++) {
            printf("%3d", a[x][y]);
        }
        printf("\n");
    }
    printf("%d", count);
    return 0;
}

#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX 5000 + 10
char buf[MAX], s[MAX];
int p[MAX];

int main(int argc, const char *argv[])
{
    int n, m = 0, max = 0, x, y;
    int i, j, k;

    fgets(buf, sizeof(s), stdin);
    n = strlen(buf);
    memset(p, -1, sizeof(p));

    for (i=0; i<n; i++) {
        if (isalpha(buf[i])) {
            p[m] = i; // 去除符号只剩字母后，每个字母在原字符串中的索引
            s[m++] = toupper(buf[i]);
        }
    }

    /* for (i=0; p[i]!=-1; i++) { */
    /*     printf("%d ", p[i]); */
    /* } */
    /* printf("\n"); */

    for (i=0; i<m; i++) { // 终点
        for (j=0; i-j>=0 && i+j < m; j++) {
            if (s[i-j] != s[i+j]) break;
            if (j*2+1 > max) {
                max = j*2+1;
                x = p[i-j];
                y = p[i+j];
            }
        }
        for (j=0; i-j>=0 && i-j+1<m; j++) {
            if (s[i-j] != s[i-j+1]) break;
            if (j*2+2 > max) {
                max = j*2 + 2;
                x = p[i-j];
                y = p[i+j] + 1;
            }
        }
    }
    for (i=x; i<=y; i++) {
        printf("%c", buf[i]);
    }
    printf("\n");
    return 0;
}

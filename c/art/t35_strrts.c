#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX 5000 + 10
char buf[MAX], s[MAX];

int main(int argc, const char *argv[])
{
    int n, m = 0, max = 0;
    int i, j, k;

    fgets(buf, sizeof(s), stdin);
    n = strlen(buf);

    for (i=0; i<n; i++) {
        if (isalpha(buf[i])) s[m++] = toupper(buf[i]);
    }
    for (i=0; i<m; i++) { // 起点
        for (j=i; j<m; j++) { // 终点
            int ok = 1;
            for (k=i; k<=j; k++) { // 判断起点到终点是否是回文
                if (s[k] != s[i+j-k]) ok = 0; // i+j-k ??
            }
            if (ok && j-i+1 > max) { // 回文串的长度是否是最大的..
                max = j-i+1;
            }
        }
    }
    printf("max = %d\n", max);
    return 0;
}

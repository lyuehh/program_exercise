#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[])
{
    char word[100];
    scanf("%s", word);
    int len = strlen(word);
    int i, j;
    for (i=1; i<= len; i++) {
        if (len % i == 0) { // 从小到大循环每个周期
            int ok = 1;
            for (j=i; j<len; j++) { // 从下一个周期开始
                if (word[j] != word[j % i]) { // 判断每个周期对应位置的字符是否一样
                    ok = 0;
                    break;
                }
            }
            if (ok) {
                printf("%d\n", i);
                /* break; */
            }
        }
    }
    return 0;
}

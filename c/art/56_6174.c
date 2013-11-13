#include <stdio.h>
#include <string.h>

int get_next(int x) {
    int a, b, n;
    char s[10];

    sprintf(s, "%d", x); // 将x认为是int，转化为字符串保存到s中
    n = strlen(s);
    int i, j;

    // 按从小到大冒泡排序，得到的是x中所有数字组合中最小的
    for (i=0; i<n; i++) {
        for (j=i+1; j<n; j++) {
            if (s[i] > s[j]) {
                char t = s[i];
                s[i] = s[j];
                s[j] = t;
            }
        }
    }
    sscanf(s, "%d", &b); // 将s认为是int，保存到b中

    // 翻转字符串，得到x中所有数字组合中最大的
    for (i=0; i<n/2; i++) {
        char t = s[i];
        s[i] = s[n-i-1];
        s[n-i-1] = t;
    }
    sscanf(s, "%d", &a);
    return a - b;
}

int num[2000], count;

int main(int argc, const char *argv[])
{
    scanf("%d", &num[0]);
    printf("%d", num[0]);
    count = 1;
    for (;;) {
        num[count] = get_next(num[count-1]);
        printf(" -> %d", num[count]);

        int found = 0;
        int i;
        for (i=0; i<count; i++) {
            if (num[i] == num[count]) {
                found = 1;
                break;
            }
        }
        if (found) {
            break;
        }
        count++;
    }
    printf("\n");
    return 0;
}

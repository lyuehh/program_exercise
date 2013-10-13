#include <stdio.h>
#include <string.h>

int main() {
    char arrChar1[] = {'a', 'b', '\0', 'd', 'e'};
    char arrChar2[] = "hello";
    char *p = "hello";
    printf("%ld\n", sizeof(arrChar1)); // 5 返回数组大小
    printf("%ld\n", strlen(arrChar1)); // 2 提前遇到了字符串结束符'\0'
    printf("%ld\n", sizeof(arrChar2)); // 6 数组长度加1
    printf("%ld\n", strlen(arrChar2)); // 5
    printf("%ld\n", sizeof(p)); // 8 结果指的是指针大小
    printf("%ld\n", strlen(p)); // 5
}

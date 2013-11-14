#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int n;
char word[2000][10], sorted[2000][10]; // 2000个单词，每个10个字母

int cmp_char(const void* _a, const void* _b) {
    char *a = (char *)_a;
    char *b = (char *)_b;
    return *a - *b;
}

int cmp_string(const void* _a, const void* _b) {
    char *a = (char *)_a;
    char *b = (char *)_b;
    return strcmp(a, b);
}

int main(int argc, const char *argv[])
{
    n = 0;
    int i;
    for (;;) {
        scanf("%s", word[n]);
        if (word[n][0] == '*') break;
        n++;
    }
    // 排序所有单词
    qsort(word, n, sizeof(word[0]), cmp_string); // 第4个参数是一个函数，函数接受2个参数，都是const void*类型的，需要自己转为合适的格式

    for (i=0; i<n; i++) {
        printf("[%s] ", word[i]);
    }
    printf("\n");

    for (i=0; i<n; i++) {
        strcpy(sorted[i], word[i]);
        // 排序每个单词
        qsort(sorted[i], strlen(sorted[i]), sizeof(char), cmp_char);
        printf("(%s) ", sorted[i]);
    }
    printf("\n");

    char s[10];
    while(scanf("%s", s) == 1) {
        qsort(s, strlen(s), sizeof(char), cmp_char); // 排序输入的单词
        int found = 0;
        for (i=0; i<n; i++) {
            if (strcmp(sorted[i], s) == 0) { // 如果排序后的输入单词和已经排好序的词典中的单词相同，则输出, 这里没有break，所有会找到所有的单词
                found = 1;
                printf("%s ", word[i]);
            }
        }
        if (!found) {
            printf(":(");
        }
        printf("\n");
    }
    return 0;
}

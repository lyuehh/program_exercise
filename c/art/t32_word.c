#include <stdio.h>
#include <string.h>

#define MAX 1000
char str[MAX];

int main(int argc, const char *argv[])
{
    int svg = 0;
    int sum = 0;
    int count = 0;
    while (scanf("%s", str) != EOF) {
        int len = strlen(str);
        sum += len;
        count++;
        /* printf("len: %d\n", len); */
    }
    printf("%d\n", sum / count);
    return 0;
}

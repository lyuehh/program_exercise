#include <stdio.h>
#include <string.h>

int main(int argc, const char *argv[])
{
    char *t2 = "Merry Christmas";
    char t1[10];
    strncpy(t1, &t2[3], 5); // 从 t2[3], 开始, 复制5个字符..
    printf("%s\n", t1);
    return 0;
}

#include <stdio.h>
int main(void)
{
    int a[5];
    printf("%x\n", a); // e8
    printf("%x\n", a+1); // e8 + 4 -> ac
    printf("%x\n", &a); // e8
    printf("%x\n", &a+1); // e8 + 14 ?
}

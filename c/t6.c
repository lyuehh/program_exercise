#include <stdio.h>
int main(void)
{
    int a[5];
    printf("%x\n", a); // a8
    printf("%x\n", a+1); // a8 + 4 -> ac
    printf("%x\n", &a); // a8
    printf("%x\n", &a+1); // a8 + 
}

#include <stdio.h>
#include <string.h>

char s[] = "abcdefgh";

void shift1(int n) {
    /* "abcd" -> "bcda" */
    char temp[10] = {'\0'};
    int i;
    char c = s[0];
    for (i=1; i<n; i++) {
        s[i-1] = s[i];
    }
    s[n-1] = c;
}

int main(int argc, const char *argv[])
{
    /* "abcdefgh" -> "defghabc" */
    int i = 3;
    while (i--) {
        shift1(8);
    }
    printf("%s\n", s);

    return 0;
}


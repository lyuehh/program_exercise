#include <stdio.h>
#include <string.h>

char s[] = "abcdefgh";

void swap(int n, int i) {
    char temp[10] = {'\0'};
    strncpy(temp, s, i);

    int ii, jj;
    for (ii=i; ii<n; ii++) {
        s[ii-i] = s[ii];
    }
    for (ii=0; ii<i; ii++) {
        s[ii+(n-i)] = temp[ii];
    }
}

int main(int argc, const char *argv[])
{
    /* "abcdefgh" -> "defghabc" */
    char temp[10];

    swap(8, 4);
    printf("%s\n", s);

    return 0;
}

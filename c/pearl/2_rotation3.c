#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char s[] = "abcdefgh";

int gcd(int i, int j) {
    while (i != j) {
        if (i > j) {
            i -= j;
        } else {
            j -= i;
        }
    }
    return i;
}

void swap(int n, int i) {
    int times = gcd(i, n);
    int ii;
    for (ii=0; ii<times; ii++) {
        char t = s[ii];
        int j = ii;
        for (;;) {
            int k = j + i;
            if (k >= n) {
                k -= n;
            }
            if (k == ii) {
                break;
            }
            s[j] = s[k];
            j = k;
        }
        s[j] = t;
    }
    /* printf("%d\n", times); */
}

int main(int argc, const char *argv[])
{
    /* "abcdefgh" -> "defghabc" */
    /* char temp[10]; */
    /* printf("%d\n", gcd(4, 8)); */
    /* printf("%d\n", gcd(16, 8)); */
    /* printf("%d\n", gcd(7, 8)); */
    /* printf("%d\n", gcd(18, 24)); */

    swap(8, 4);
    printf("%s\n", s);

    return 0;
}


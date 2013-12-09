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

/* change x[a..a+m-1] and x[b..b+m-1] */
void swap(a, b, m) {

}

void doit(int n, int i) {
    if (i == 0 || n == i) {
        return;
    }
    int p;
    int ii = p = i;
    int j = n - p;
    while (i != j) {
        if (i > j) {
            swap(p-i, p, j);
            i -= j;
        } else {
            swap(p-i, p+j-i, i);
            j -= i;
        }
    }
    swap(p-i, p, i);
}

int main(int argc, const char *argv[])
{
    /* "abcdefgh" -> "defghabc" */
    /* char temp[10]; */
    /* printf("%d\n", gcd(4, 8)); */
    /* printf("%d\n", gcd(16, 8)); */
    /* printf("%d\n", gcd(7, 8)); */
    /* printf("%d\n", gcd(18, 24)); */

    /* swap(8, 4); */
    /* printf("%s\n", s); */

    return 0;
}


#include <stdio.h>

int search(char a[], int len, int x) {
    int l = 0, h = len - 1;
    for(;;) {
        int m = (l+h) / 2;
        if (l > h) {
            return -1;
        }
        if (a[m] == x) {
            return m;
        } else if (a[m] < x) {
            l = m + 1;
        } else {
            h = m - 1;
        }
    }
}

int main(int argc, const char *argv[])
{
    char a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    printf("%d\n", search(a, 9, 33));
    return 0;
}

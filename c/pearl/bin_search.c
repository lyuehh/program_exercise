#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int a[10] = {1, 2, 3, 4, 5, 6, 7};

int bin_search(int n) {
    int low = 0, high = 6;
    while (low < high) {
        int mid = (low + high) / 2;
        if (a[mid] == n) {
            return mid;
        } else if (a[mid] > n) {
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }
    return -1;
}


int main(int argc, const char *argv[])
{
    printf("%d\n", bin_search(65));
    return 0;
}

#include <stdio.h>

int main(int argc, const char *argv[])
{
    int n;
    int i;
    int flag = 0;
    scanf("%d", &n);
    while (n >= 1) {
        int space = flag;
        while (space > 0) {
            printf(" ");
            space--;
        }
        for (i=0; i<2*n-1; i++) {
            printf("#");
        }
        printf("\n");
        flag++;
        n--;
    }
    return 0;
}

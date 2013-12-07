#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int max = 50000 + 10;
int s[max] = {0};
int left[max], right[max];
int n, m;

void link(int a, int b) {
    right[a] = b;
    left[b] = a;
}

/* ??? */

int main(int argc, const char *argv[])
{

    scanf("%d %d", &n, &m);
    int i;
    for (i=1; i<=n; i++) {
        left[i] = i-1;
        right[i] = i+1;
    }
    right[n] = 0;
    while (m--) {
        int x, y;
        char type[2];
        scanf("%s%d%d", type, &x, &y);
        link(left[x], right[x]);
        if (type[0] == 'B') {
            link(x, right[y]);
            link(y, x);
        } else {
            link(left[y], x);
            link(x, y);
        }
        int head;
        for (head=1; head<=n&&left[head] != 0; head++) {
            printf("%d ", head);
        }
        while (right[head] != 0) {
            head = right[head];
            printf("%d ", head);
        }
        printf("\n");
    }
    return 0;
}

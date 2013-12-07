#include <stdio.h>

int s[50000+10] = {0};
int n, m;

int find(int key) {
    int i;
    for (i=1; i<=n; i++) {
        if (s[i] == key) {
            return i;
        }
    }
    return -1;
}

void shift_circular_left(int l, int r) {
    /* pabcq -> abcpq */
    int key = s[l];
    int i;
    for (i=l; i<r; i++) {
        s[i] = s[i+1];
    }
    s[r] = key;
}

void shift_circular_right(int l, int r) {
    /* 4321 -> 1432 */
    int key = s[r];
    int i;
    for (i=r; i>l; i--) {
        s[i] = s[i-1];
    }
    s[l] = key;
}

int main(int argc, const char *argv[])
{
    scanf("%d %d", &n, &m);
    int i;
    for (i=1; i<=n; i++) {
        s[i] = i;
    }
    while (m--) {
        int x, y;
        char type[2];
        scanf("%s%d%d", type, &x, &y);
        int p = find(x);
        int q = find(y);
        if (type[0] == 'A') {
            /* 1...4 -> ...14*/
            /* 4...1 -> 14... */
            if (q>p) shift_circular_left(p, q-1);
            else shift_circular_right(q, p);
        } else {
            if (q>p) shift_circular_left(p, q);
            else shift_circular_right(q+1, p);
        }
        for (i=1; i<=n; i++) printf("%d ", s[i]);
        printf("\n");
        /* printf("type: %s\n", type); */
        /* printf("X: %d\n", X); */
        /* printf("Y: %d\n", Y); */
    }
    return 0;
}


#include <stdio.h>
#define MAX 1000
int boom;
int foo(int n) {
    boom = 1 / (MAX-n+1);
    printf("%d\n", n);
    foo(n+1);
}
int main() {
    foo(1);
}

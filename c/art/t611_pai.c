#include <stdio.h>

const int MAXN = 50;
int queue[MAXN];

int main(int argc, const char *argv[])
{
    int n, front, rear;
    scanf("%d", &n);
    int i;
    for (i=0; i<n; i++) queue[i] = i+1;
    front = 0;
    rear = n;
    while (front < rear) {
        printf("%d\n", queue[front++]);
        queue[rear++] = queue[front++];
    }
    return 0;
}

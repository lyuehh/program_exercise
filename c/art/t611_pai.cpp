#include <cstdio>
#include <queue>

using namespace std;

queue<int> q;

int main(int argc, const char *argv[])
{
    int n;
    scanf("%d", &n);
    int i;
    for (i=0; i<n; i++) q.push(i+1);
    while (!q.empty()) {
        printf("%d\n", q.front());
        q.pop();
        q.push(q.front());
        q.pop();
    }
    return 0;
}


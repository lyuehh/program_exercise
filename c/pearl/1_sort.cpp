#include <iostream>
#include <set>

using namespace std;
int main(int argc, const char *argv[])
{
    set<int> s;
    int i;
    set<int>::iterator j;
    while(cin >> i)
        s.insert(i);
    for (j=s.begin(); j!=s.end(); ++j) {
        cout << *j << '\n';
    }

    return 0;
}

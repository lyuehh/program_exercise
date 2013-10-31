#include <iostream>
#include <fstream>
using namespace std;

ifstream fin("aplusb.in");
ofstream fout("aplusb.out");

#define fin cin
#define fout cout

int main(int argc, const char *argv[])
{
    int a, b;
    while (fin >> a >> b) fout << a + b << endl;
    return 0;
}

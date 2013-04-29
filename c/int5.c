#include <stdio.h>
static void (*f[2])(int);
static void p(int i){ printf("%d\n", i);}
static void e(int i){ exit(0); }
static void r(int i){ f[(i-1)/1000](i);  r(i+1);}
int main(int argc, char* argv[]) {
  f[0] = p; f[1] = e; r(1);
}

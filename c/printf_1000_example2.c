#include <stdlib.h>
#include <signal.h>
int i=1;
int foo() {
  int j=i/(i-1001);
  printf("%d\n", i++);
  foo();
}
int main(){
  signal(SIGFPE, exit);
  foo();
}


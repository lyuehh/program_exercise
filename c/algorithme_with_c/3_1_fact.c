#include <stdio.h>

int fact(int n) {
  if (n<0) {
    return 0;
  } else if (n == 0) {
    return 1;
  } else if (n == 1) {
    return 1;
  } else {
    return n * fact(n-1);
  }
}

int main(int argc, const char *argv[])
{
  printf("%d\n", fact(15));
  return 0;
}

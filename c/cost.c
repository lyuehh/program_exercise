#include <stdio.h>

int main(int argc, const char *argv[])
{
  int i = 11;
  int const *p = &i;
  p++;
  printf("%d\n", *p);
  return 0;
}

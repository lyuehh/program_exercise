#include <stdio.h>
#include <stdlib.h>
int main(int j) {
  printf("%d\n", j);
  (&main + (&exit - &main)*(j/1000))(j+1);
}

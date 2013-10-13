#include <stdio.h>
static void print_line(int i){
   printf("%d\n", i);
   print_line(i+1);
}
int main(int argc, char* argv[]){
   //get up near the stack limit
  char tmp[ 8388608 - 32 * 1000 - 196 * 32 ];
  print_line(1);
}

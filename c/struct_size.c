#include <stdio.h>
int b(void) { printf("3"); return 3; }
int c(void) { printf("4"); return 4; }
int main(void)
{
 int a = b() + c();
 printf("%d\n", a);
 int aa = 41;
 int bb = aa++;
 if (aa++ < 42)
   printf("%d\n", aa);
 printf("%d\n", bb);

 {
   int a=41; a++ & printf("%d\n", a);
 }

 {
   int a=41; a = a++; printf("%d\n", a);
 }

 {
   printf("%ld,", sizeof(4));
   struct X {
     int a;
     char b;
     int c;
   };
   printf("%ld,", sizeof(struct X));

   struct Y {
     int a;
     char b;
     int c;
     char d;
   };
   printf("%ld,", sizeof(struct Y));

   struct Z {
     int a;
     char b;
     char d;
     int c;
   };
   printf("%zu\n", sizeof(struct Z));
 }
}

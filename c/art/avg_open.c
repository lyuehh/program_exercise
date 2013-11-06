#include <stdio.h>


int main(int argc, const char *argv[])
{
    FILE *fin, *fout;
    fin = fopen("avg.in", "rb");
    fout = fopen("avg.out", "wb");

//    fin = stdin;
//    fout = stdout;

    int x, n = 0, min, max, s = 0;
    scanf("%d", &x);
    min = max = x;
    while (fscanf(fin, "%d", &x) == 1) {
        s += x;
        if (x < min) {
            min = x;
        }
        if (x > max) {
            max = x;
        }
        n++;
    }
    fprintf(fout, "%d %d %.3f\n", min, max, (double)s/n);
    fclose(fin);
    fclose(fout);
    return 0;
}

//KMP Algorithm

#include <cstdio>
#include <cstring>
using namespace std;

const int maxn=250100;
char s1[maxn*2];
char s2[maxn];
int P[maxn];
int n;

int KMP(const char* A,const char* B){//begin with 1
    int N=2*n,M=n;//int N=strlen(A),M=strlen(B);
    //int* P=new int[M];
    int i=0;
    int j=P[0]=-1;
    do{
        while(j!=-1&&B[i]!=B[j])
            j=P[j];
        if(B[++i]==B[++j])
            P[i]=P[j];
        else P[i]=j;
    }while(i+1<M);

    i=-1;
    j=-1;
    do{
        while(j!=-1&&A[i]!=B[j])
            j=P[j];
        if(j+1>=M)
            return i-M+1;
        ++i;++j;
    }while(N-i>=M-j);

    return -1;
}

int main(){
    scanf("%d\n",&n);
    gets(s1);
    memcpy(s1+n,s1,sizeof(char)*n);
    s1[2*n]='\0';
    gets(s2);
    s2[n]='\0';
    
    int p=KMP(s1,s2);
    
    if(p==-1)
        puts("-1");
    else if(p==0)
        puts("0");
    else
        printf("%d\n",n-p);
}

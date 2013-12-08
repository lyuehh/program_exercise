#include <iostream>
using namespace std;

int main()
{
    bool first=true;
    int sum =0;
    int current_value;
    for(unsigned short i=65535;i>=0;--i )
    {
        if(first)
        {
            current_value=65535;
            sum+=current_value%3;
            first=false;
        }
        if (i == 0) {
            printf("----\n");
            // break;
        }
        else
        {
            sum+=-current_value%3;
            printf("i: %d\n", i);
            if(current_value<=0)
            {
                printf("%d,%d",sum,i);
                break;
            }
        }
    }
}

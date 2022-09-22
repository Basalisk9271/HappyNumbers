//This is my c program for Happy Num
#include <stdio.h>

void main(){
    int lowerBound, upperBound;
    printf("First Argument: ");
    scanf ("%d", &lowerBound);
    printf("Second Argument: ");
    scanf ("%d", &upperBound);

    if (lowerBound > upperBound) {
        int temp = upperBound;
        upperBound = lowerBound;
        lowerBound = temp;
    }
    
}
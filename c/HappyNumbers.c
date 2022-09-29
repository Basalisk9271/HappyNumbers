//This is my c program for Happy Num

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
  
struct Node {
    int data;
    struct Node* next;
};//Struct found on GeeksforGeeks's website regarding linked lists

double isHappy(int n);

void main(){
    int lowerBound, upperBound;
    printf("First Argument: ");
    scanf ("%d", &lowerBound);
    printf("Second Argument: ");
    scanf ("%d", &upperBound);
    int happyCount = 0;

    if (lowerBound > upperBound) {
        int temp = upperBound;
        upperBound = lowerBound;
        lowerBound = temp;
    }
    int runningTotal;
    double normTotal;
    for (int i = lowerBound;i<upperBound+1; i++){
        runningTotal = 0;
        int *runningTotalPointer = &runningTotal;
        if (isHappy(i)) {
            happyCount++;
            printf("%d", i);
            printf("---------%f", normTotal);
            printf("\n");
        }
        
    }
    
}
double isHappy(int num) //This is the method from rosetta code to implement the isHappy boolean
{
	struct Node* cache = NULL;

    int sum = 0, initialNum = num;
    int runningTotalForNorm = (num*num)+1;
    while (num != 1){
        if (search(cache, num)){
            return -1;
        }
        push(&cache, num);
        
        while (num != 0){
            int digit = num % 10;
            sum += digit*digit;
            num/=10; 
        }
        num += sum;
        runningTotalForNorm += (num*num);
        sum = 0;
    }
    double norm = sqrt((double)runningTotalForNorm);
    struct Node* x = cache;
    cache = cache->next;
    free(x);
    return norm;
}

/* Checks whether the value x is present in linked list 
Found on https://www.geeksforgeeks.org/search-an-element-in-a-linked-list-iterative-and-recursive/ */
bool search(struct Node* head, int x)
{
    struct Node* current = head; // Initialize current
    while (current != NULL) {
        if (current->data == x)
            return true;
        current = current->next;
    }
    return false;
}

/* Given a reference (pointer to pointer) to the head
  of a list and an int, push a new node on the front
  of the list. 
  Found on https://www.geeksforgeeks.org/search-an-element-in-a-linked-list-iterative-and-recursive/ */
void push(struct Node** head_ref, int new_key)
{
    /* allocate node */
    struct Node* new_node
        = (struct Node*)malloc(sizeof(struct Node));
 
    /* put in the data  */
    new_node->data = new_key;
 
    /* link the old list off the new node */
    new_node->next = (*head_ref);
 
    /* move the head to point to the new node */
    (*head_ref) = new_node;
}

void printDict(){

}
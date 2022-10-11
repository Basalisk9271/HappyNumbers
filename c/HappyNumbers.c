//Gabe Imlay
//CSC330: Organization of Programming Languages
//Project 1: Happy Numbers -> C
//October 7th, 2022

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct Node {
    int data;
    struct Node* next;
};//Struct found on GeeksforGeeks's website regarding linked lists

struct KVPair {
    int happyNumber;
    double norm;
};//Struct for holding my happy numbers and norms while sorting

double isHappy(int n);
bool searchLL(struct Node* head, int x);
void push(struct Node** head_ref, int new_key);
int compare (const void * a, const void * b);
void printArr(struct KVPair happyArray[]);

int main(){
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
    double norm;
    struct KVPair happyArray[10];
    for (int i = 0; i < 10; i++){
        struct KVPair newKVP = {0,0};
        happyArray[i] = newKVP;
    }//Forced the array to initialize with zeros for the values inside the structs
    for (int i = lowerBound;i<upperBound+1; i++){
        if (isHappy(i) != -1) {
            norm = isHappy(i);
            struct KVPair newKVP = {i,norm};
            if (newKVP.norm > happyArray[9].norm){
                happyArray[9] = newKVP;
            }
            qsort(happyArray, 10, sizeof(struct KVPair), compare);
        }
    }
    printArr(happyArray);

    return 0;

}

/*This is a function mirroring the isHappy from c# since I liked its simplicity better.
This function outputs the norm calculation as a doube so it can be added to map*/
double isHappy(int num){ 
	struct Node* cache = NULL;

    int sum = 0;
    double runningTotalForNorm = 1;
    long temp;
    while (num != 1){
        temp = (long)num;
        runningTotalForNorm += (temp*temp);
        if (searchLL(cache, num)){
            return -1;
        }
        push(&cache, num);
        
        while (num != 0){
            int digit = num % 10;
            sum += digit*digit;
            num/=10; 
        }
        num += sum;
        sum = 0;
    }
    double norm = sqrt(runningTotalForNorm);
    struct Node* curr;
    while ((curr = cache) != NULL) { //Frees up the memory
        cache = cache->next;          //Code found on https://stackoverflow.com/questions/7025328/linkedlist-how-to-free-the-memory-allocated-using-malloc
        free (curr);                
    }

    return norm;
}

/* Checks whether the value x is present in linked list 
Found on https://www.geeksforgeeks.org/search-an-element-in-a-linked-list-iterative-and-recursive/ */
bool searchLL(struct Node* head, int x){
    struct Node* current = head; // Initialize current
    while (current != NULL) {
        if (current->data == x)
            return true;
        current = current->next;
    }
    return false;
}

/* Given a reference (pointer to pointer) to the head of a list and an int, push a new node on the front of the list. 
  Found on https://www.geeksforgeeks.org/search-an-element-in-a-linked-list-iterative-and-recursive/ */
void push(struct Node** head_ref, int new_key){
    /* allocate node */
    struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
 
    /* put in the data  */
    new_node->data = new_key;
 
    /* link the old list off the new node */
    new_node->next = (*head_ref);
 
    /* move the head to point to the new node */
    (*head_ref) = new_node;
}

/*Comparator function to sort the array
This was found on https://www.gnu.org/software/libc/manual/html_node/Comparison-Functions.html and 
https://iq.opengenus.org/qsort-in-c/ */
int compare (const void * a, const void * b){
  const struct KVPair *pair1 = a;
  const struct KVPair *pair2 = b;
  if (pair1->norm > pair2->norm)
      return -1;
   else if (pair1->norm < pair2->norm)
      return 1;
   else
      return 0;
}

/*This is a function to print the array passed into it*/
void printArr(struct KVPair happyArray[]){
    if (happyArray[0].happyNumber == 0){
        printf("NOBODYS HAPPY!\n");
    }
    else{
        int i = 0;
        while (i < 10 && happyArray[i].norm != 0 && happyArray[i].happyNumber != 0){
            printf("%d ", happyArray[i].happyNumber);
            //printf("---------%f", happyArray[i].norm); //This was used to check whether the norms are printing with the correct values
            printf("\n");
            i++;
        }
    }
    
    
       
}

//Gabe Imlay
//CSC330: Organization of Programming Languages
//Project 1: Happy Numbers -> Go
//October 7th, 2022

//Tutorials Point is where I found most of my structure and how to call different things
//https://www.tutorialspoint.com/go/index.htm

package main

//import "os"
//import "strings"
import "math"
import "fmt"
//import "sort"
//import "log"


type KVPair struct {
    happyNum int64
    norm float64 
}//define a struct to hold the happyNums and norms

func main () {
    var  num1, num2, i int64;
    var norm float64;

    fmt.Print("First Argument: ")
    fmt.Scanln(&num1)
    fmt.Print("Second Argument: ")
    fmt.Scanln(&num2)
    
    if (num1 > num2) {
        num1, num2 = num2, num1
    }

    // if the first number is larger than the second number, swap the numbers
    var happyArray[10] KVPair
    for i = 0; i < 10; i++ { //initialize the array of structures
        happyArray[i].happyNum = 0
        happyArray[i].happyNum = 0
    }
    
    for i = num1; i < num2+1; i++ {
        if (isHappy(i) != -1){
            norm = isHappy(i);
            if(norm > happyArray[9].norm){
                happyArray[9].happyNum = i;
                happyArray[9].norm = norm;
            }
            happyArray = BubbleSort(happyArray);
        }
    }

    /*print off the sorted array while the number in happyNum is not 0 and the counter is less than 10
    This is important because we only want the top 10 highest Norms
    If there are no happy numbers in the range, print off "NOBODYS HAPPY!"*/
    if (happyArray[0].happyNum == 0){
        fmt.Println("NOBODYS HAPPY!")
    }else {
        for i = 0; i < 10; i++ {
            if (happyArray[i].happyNum != 0){
                fmt.Printf("%d\n", happyArray[i].happyNum)
            }
                
        }
    }
    
    
    
}

//function modeled off of the c and fortran versions of my code since I did not like the one that was on rosetta code for go
func isHappy(param int64) float64 {
    var number, temp, digit, sum int64;
    var runningTotalForNorm, norm float64;
    number = param;
    runningTotalForNorm = 1;

    for (number != 1){
        sum = 0;
        temp = int64(number);
        temp = temp*temp;
        runningTotalForNorm += float64(temp);
        for (number != 0){
            digit = number%10;
            sum = sum + (digit*digit);
            number = number/10
        }
        number = number + sum;
        if (number == 4){
            return -1;
        }
    }
    norm = math.Sqrt(runningTotalForNorm);
    runningTotalForNorm = 0;
    return norm;

}

//Bubble sort from https://www.tutorialspoint.com/bubble-sort-in-go-lang to sort my array of structs
func BubbleSort(array[10] KVPair)[10]KVPair {
    for i:=0; i< len(array)-1; i++ {
       for j:=0; j < len(array)-i-1; j++ {
          if (array[j].norm < array[j+1].norm) {
             array[j], array[j+1] = array[j+1], array[j]
          }
       }
    }
    return array
 }

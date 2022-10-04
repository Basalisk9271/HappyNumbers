//Gabe Imlay
//CSC330: Organization of Programming Languages
//Project 1: Happy Numbers -> Go
//October 7th, 2022

package main

import "os"
import "strings"
import "math"
import "fmt"


type HappyNumbers struct {
}
func HappyNumbers_1() * HappyNumbers {
    var this * HappyNumbers =  &HappyNumbers{};
    return this;
}
func (this *HappyNumbers) main_1(args []string) {
    var  num1  int = Integer.parseInt(args[0]);
    var  num2  int = Integer.parseInt(args[1]);
    // take in arguments from command line
    if (num1 > num2) {
        num1 = num1 ^ num2 ^ (num2 = num1);
    }
    // if the first number is larger than the second number, swap the numbers
    var  happyNums []java.lang.Integer()
    fmt.Println("First Argument: " + args[0] + "\nSecond Argument: " + args[1]);
    for  current  := num1; current <= num2; current++ {
        if (this.isHappy(current)) {
            happyNums= append(happyNums,current);
        }
    }
    // for loop to check if there any happy numbers in the range specified by the arguments
    if (len(happyNums) == 0) {
        fmt.Println("NOBODYS HAPPY!");
    } else {
        var  map java.util.TreeMap(Collections.reverseOrder())
        for  i  := 0; i < len(happyNums); i++ {
            this.normCheck(happyNums[i], map);
        }
        this.printMap(map);
    }
}
// main method
func (this *HappyNumbers) isHappy( number  int)bool {
    var  cycle java.util.HashSet()
    // List<String> normSum
    for(number != 1 && cycle.add(number)) {
        var  numStrList*  java.util.List = Arrays.asList(strings.Split(String.valueOf(number),""));
        number = numStrList.stream().map((i)->math.Pow(float64(Integer.parseInt(i)),float64(2))).mapToInt((i)->i.intValue()).sum();
    }
    return number == 1;
}
// method found on rosetta code to check to see if the numbers are happy
func (this *HappyNumbers) normCheck( number  int,  map ) {
    var  tempNum  int = number;
    var  normSum  float64 = math.Pow(float64(number),float64(2));
    for(number != 1) {
        var  numStrList*  java.util.List = Arrays.asList(strings.Split(String.valueOf(number),""));
        number = numStrList.stream().map((i)->math.Pow(float64(Integer.parseInt(i)),float64(2))).mapToInt((i)->i.intValue()).sum();
        normSum += math.Pow(float64(number),float64(2));
    }
    var  norm  float64 = math.Sqrt(normSum + float64(1));
    map.put(norm,tempNum);
}
// method similar to the rosetta code snippet, but this one calculates the norm and adds it to the map
func (this *HappyNumbers) printMap( map ) {
    var  set*  Set = map.entrySet();
    // create a set to iterate through
    var  i*  Iterator = set.iterator();
    // iterator to iterate through the list
    var  count  int = 0;
    // while control value
    for(i.hasNext() && count < 10) {
        var  mEntry*  Map.Entry = Map.Entry(i.next());
        fmt.Println(mEntry.getValue());
        count++;
    }
}

func main(){
	var task = HappyNumbers{};
	task.main_1(os.Args);// not 100% accurate
}
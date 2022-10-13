# Project 1 - Happy Numbers

## Description
Write a program in different languages (Java, C, C#, Go, Perl, Python, Fortran, and Lisp) that takes two positive integer arguments and returns the base ten happy numbers between the two arguments sorted by by their norms in descending order. If there are more than ten happy numbers on the domain, return only the top ten happy numbers with the greatest norms; these should still be sorted descending order based on their norms. 

## Functions
This is a list of the functions included in most iterations of this program and their purposes

- `isHappy()` - This was originally a boolean function to return whether a number is happy or not; throughout different iterations, this function became both the normCheck() and the isHappy() all-in-one by outputting either a -1 if the number was unhappy and the norm value of the number if it was happy. 
- `normCheck()` - This function originally was a clone of the `isHappy()` function that would return the norm value of a given number; this function was phased out in later iterations because the functionality was included in the newer versions of the `isHappy()` functions.
- `print()` - This function prints out the happy numbers associated with the top 10 norm values; there are several variations of this function depending on the iteration of program being run; each of the functions that have "print" in their name are iterations of this function. 

## Authors and Acknowledgment
Gabe Imlay

## Project status
 -- Completed -- 

## Langauges 

---
### Java
**Logic:** For this program, I implemented both a `isHappy()` and `normCheck()` function separately. `isHappy()` is a boolean function that determines if the number enterered as a parameter is "happy" or not, and `normCheck()` returns the norm value of the happy number in question. I used a hash map inside of `isHappy()` to store the cached values during the algorithm's run. I used a tree map in this iteration to store the happy numbers and norm values as pairs since a tree map can stay ordered. 

*Disclaimer: There are not any structures that work exactly like the tree map in any of the other languages, so this is the only language that uses it* 

**Compilation:** 

To compile, run:
```
javac HappyNumbers.java
```
To execute, run:
```
java HappyNumbers
```

--- 
### C
**Logic:** For this program, I approached the issue by creating an array of structs. This way, I could store the happy numbers and norms in a single array of size 10. Then, I used a Linked List to store the values in the "cache" for dynamic allocation with two helper functions called `searchLL()` and `push()` to search the Linked List and push new numbers to the end of the Linked List respectively. This was one of the first instances of combining the `norCheck()` function into the `isHappy()` function. This is the way that I did for all of the programs besides Java, Python, and C#

**Compilation:** 

To compile, run:
```
gcc -lm HappyNumbers.c
```
To execute, run:
```
./a.out
```
--- 
### C#
**Logic:** The logic of this one is very similar to Java, so much so that some of the statements in Java could be copied and pasted if needed. There was no need for a `normCheck()` function in this iteration because I could pass the Sorted Dictionary into the `isHappy()` function. By doing this, the norm could be added with the happy number at the end of the function before returning boolean. This is not the same way that most of the others are done. This is only the case here because I could use pass by reference. I used a Sorted Dictionary in place of an array or map. 

**Compilation:** 

To compile, run:
```
mcs HappyNumbers.cs
```
To execute, run:
```
mono HappyNumbers.exe
```
--- 
### Go
**Logic:** This iteration of the program is almost exactly the same as the C iteration. I used a statically sized array of structs to hold the highest ten pairs of happy numbers and norms. I did not use anything to hold the cache numbers because I implemented different logic in this one. Every unhappy number would eventually have a 4 in the sequence. As such, I could exclude any number with a 4 in the sequence. As with all of the iterations that use the array of structs methodology, this one also includes a sort. Instead of a quick sort, I decided on a Bubble Sort to sort the array after each pass. 

**Compilation:** Similar to Python, this can be achieved by running the single command below. 
```
go run HappyNumbers.go
```
--- 
### Perl
**Logic:** This iteration of the program is very similar to Python in its constructon and implementation. I used hashes instead of lists to store the happy numbers and their associated norms. A hash was also used to simulate a cache in the `isHappy()` function, which returns a norm instead of a boolean like the Python iteration of this program. I paired this with a `printHappy()` function to print off all of the happy numbers associated with the highest norm. 

**Compilation:** You'll need to make the file executable if it is not already by using `chmod 700 HappyNumbers.pl`. Then, run the command below to execute. 
```
./HappyNumbers.pl
```
--- 
### Python
**Logic:** This iteration of the program is very similar to the Perl iteration. I used lists to store the cache of numbers in `isHappy()` and I used a Sorted Dictionary for holding my happy number/norm pairs. The `isHappy()` function is just a boolean to determine if a number is happy while the `normCheck()` function calculates the norm of the number read into it. This was almost exactly translated from Java and resembles the Java the most. 

**Compilation:** Similar to Go, this can be achieved by running the single command below. 
```
python3 HappyNumbers.py
```
--- 
### Fortran
**Logic:** This iteration of the program utilizes the same structure as the C iteration. I used a statically sized array of structs to hold the highest ten pairs of happy numbers and norms. I did not use anything to hold the cache numbers because I implemented different logic in this one. Every unhappy number would eventually have a 4 in the sequence. As such, I could exclude any number with a 4 in the sequence. As with all of the iterations that use the array of structs methodology, this one also includes a sort. I decided on a Bubble Sort to sort the array after each pass. 

**Compilation:** 

To compile, run:
```
gfortran HappyNumbers.f95
```
To execute, run:
```
./a.out
```
--- 
### Lisp
**Logic:** This iteration of the program is different from any of the other iterations. For this iteration, I went with dual global arrays, one for my happy numbers and one for my norms, that could be sorted as the happy numbers were found. The `isHappy()` function in this iteration will return the norm value, which is used to determine whether the norm and happy number will be added to the arrays. I also used a Bubble Sort for this iteration, but this Bubble Sort swaps things in the norm array and then does the same exact swap to the same indicies in the happy number array so that they stay matched. Then, it loops through and prints the ten happy numbers with the highest norms. 

**Compilation:** You'll need to make the file executable if it is not already by using `chmod 700 HappyNumbers.lisp`. Then, run the command below to execute.  
```
./HappyNumbers.pl
```
--- 

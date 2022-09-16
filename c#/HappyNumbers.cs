//This is my C# code for the Happy Numbers Project
// Include namespace system
using System;
using System.Collections.Generic;

using System.Linq;

using System.Collections;



public class HappyNumbers
{
    public static void Main()
    {
        Console.Write("First Argument: ");
        var num1 = int.Parse(Console.ReadLine());
        Console.Write("Second Argument: ");
        var num2 = int.Parse(Console.ReadLine());
        // take in arguments from command line
        if (num1 > num2)
        {
            num1 = num1 ^ num2 ^ (num2 = num1);
        }
        // if the first number is larger than the second number, swap the numbers
        int happyNumCount = 0;
        var normDict = new SortedDictionary<double, int>();
        for (int current = num1; current <= num2; current++)
        {
            if (HappyNumbers.isHappy(current, ref normDict))
            {
                happyNumCount++;
            }
        }// for loop to check if there any happy numbers in the range specified by the arguments
        if (happyNumCount == 0)
        {
            Console.WriteLine("NOBODYS HAPPY!");
        }
        else 
        {
            HappyNumbers.printDict(normDict);
        }
    }// main function
    
    public static bool isHappy(int number, ref SortedDictionary<double,int> dict)
    {
        List<int> cache = new List<int>();
        int sum = 0;
        int initialNumber = number; //holds the initial number
        double runningTotalForNorm = Math.Pow(initialNumber,2)+1; //Started norm off with 1 since I need to add 1 at the end
        while (number != 1)
        {
            if (cache.Contains(number))
            {
                return false;
            }
            cache.Add(number);
            while (number != 0)
            {
                int digit = number % 10;
                
                sum += digit * digit;
                
                number /= 10;

            }
            number += sum;
            runningTotalForNorm += Math.Pow(number,2);
            sum = 0;
        }
        double norm = Math.Sqrt(runningTotalForNorm);
        dict.Add(norm, initialNumber);
        return true;        
    }// funtion found on rosetta code but modified to check to see if the 
    //numbers are happy and then to calculate the norms of the happy numbers so they could be added to a sorted dictionary
    
    public static void printDict(SortedDictionary <double, int> dict)
    {
        var items = from pair in dict
            orderby pair.Key descending
            select pair;

        var counter = 0;
        foreach (KeyValuePair<double, int> pair in items)
        {
         
        
            if (counter >= 10){
                break;
            }
            else{
                Console.WriteLine(pair.Value + " ------" + pair.Key);
                counter++;  
            }   
        }
    }//function to print the top 10 items in the dictionary in descending order, printing the norms from highest to lowest in the top 10
}
import java.util.*;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet; 
import java.util.List;
import java.lang.Math;

public class HappyNumbers {


   public static void main(String[] args) {
       int num1 = Integer.parseInt(args[0]);
       int num2 = Integer.parseInt(args[1]); //take in arguments from command line
       if (num1 > num2){
           num1 = num1 ^ num2 ^ (num2 = num1);
       }//if the first number is larger than the second number, swap the numbers
       ArrayList<Integer> happyNums = new ArrayList<Integer>();
       
       System.out.println("First Argument: "+args[0]+"\nSecond Argument: "+args[1]);
       for (int current = num1; current <= num2; current++){
            if (isHappy(current)) {
                happyNums.add(current);
            }
       }//for loop to check if there any happy numbers in the range specified by the arguments
           
        
        if (happyNums.size() == 0){
            System.out.println("NOBODYS HAPPY!");
        }//if there are no happy numbers in range, print this message
        else{
             Map<Double, Integer> map = new TreeMap<Double, Integer>(Collections.reverseOrder());
            for (int i = 0; i < happyNums.size(); i++){
                normCheck(happyNums.get(i), map);
            }
            printMap(map);
        }//if there are happy numbers in the specified range, check their norms, map them in a treemap, and print them 
       
   }//main method

   public static boolean isHappy(int number) {
       HashSet<Integer> cycle = new HashSet<>();
       //List<String> normSum
       while (number != 1 && cycle.add(number)) {
           List<String> numStrList = Arrays.asList(String.valueOf(number).split(""));
           number = numStrList.stream().map(i -> Math.pow(Integer.parseInt(i), 2)).mapToInt(i -> i.intValue()).sum();

       }
       return number == 1;
   }//method found on rosetta code to check to see if the numbers are happy

   public static void normCheck(int number, Map<Double, Integer> map) {
       int tempNum = number; 
       double normSum = Math.pow(number,2);
       
       while (number != 1) {
            List<String> numStrList = Arrays.asList(String.valueOf(number).split(""));
            number = numStrList.stream().map(i -> Math.pow(Integer.parseInt(i), 2)).mapToInt(i -> i.intValue()).sum();
            normSum += Math.pow(number, 2);
       }
       double norm = Math.sqrt(normSum+1);
       map.put(norm,tempNum); 
   }//method similar to the rosetta code snippet, but this one calculates the norm and adds it to the map

   public static void printMap(Map<Double, Integer> map){
        Set set = map.entrySet();//create a set to iterate through
        Iterator i = set.iterator(); //iterator to iterate through the list
        int count = 0; //while control value
        while (i.hasNext() && count < 10) {
            Map.Entry mEntry = (Map.Entry)i.next();
            System.out.println(mEntry.getValue());
            count++;
        }//Iterates through the map and pulls the first 10 highest norms
    }//method to print the first 10 entries in the map
}
import java.util.*;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashSet; 
import java.util.List;
//Test Comment
public class HappyNumbers {


   public static void main(String[] args) {
       int num1 = Integer.parseInt(args[0]);
       int num2 = Integer.parseInt(args[1]);
       if (num1 > num2){
           num1 = num1 ^ num2 ^ (num2 = num1);
       }//if the first number is larger than the second number, swap the numbers
       ArrayList<int> happyNums = new ArrayList<int>();
       
       System.out.println("First Argument: "+args[0]+"\nSecond Argument: "+args[1]);
       for (int current = num1; current <= num2; current++)
           if (isHappy(current)) {
               System.out.println(current);
               happyNums.add(current);
               //total++;
           }
   }

   public static boolean isHappy(int number) {
       HashSet<Integer> cycle = new HashSet<>();
       List<String> normSum
       while (number != 1 && cycle.add(number)) {
           List<String> numStrList = Arrays.asList(String.valueOf(number).split(""));
           number = numStrList.stream().map(i -> Math.pow(Integer.parseInt(i), 2)).mapToInt(i -> i.intValue()).sum();

       }
       return number == 1;
   }//method found on rosetta code to check to see if the numbers are happy

   public static boolean normCheck(int number) {
       HashSet<Integer> cycle = new HashSet<>();
       List<String> normSum
       while (number != 1 && cycle.add(number)) {
           List<String> numStrList = Arrays.asList(String.valueOf(number).split(""));
           number = numStrList.stream().map(i -> Math.pow(Integer.parseInt(i), 2)).mapToInt(i -> i.intValue()).sum();

       }
       return number == 1;
   }//method found on rosetta code to check to see if the numbers are happy
}
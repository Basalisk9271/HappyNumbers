import java.util.*;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashSet; 
import java.util.List;
import java.lang.Math;
//Test Comment
public class HappyNumbers {


   public static void main(String[] args) {
       int num1 = Integer.parseInt(args[0]);
       int num2 = Integer.parseInt(args[1]);
       if (num1 > num2){
           num1 = num1 ^ num2 ^ (num2 = num1);
       }//if the first number is larger than the second number, swap the numbers
       ArrayList<Integer> happyNums = new ArrayList<Integer>();
       
       System.out.println("First Argument: "+args[0]+"\nSecond Argument: "+args[1]);
       for (int current = num1; current <= num2; current++)
           if (isHappy(current)) {
               //System.out.println(current);
               happyNums.add(current);
               //total++;
           }
        
        if (happyNums.size() == 0){
            System.out.println("NOBODYS HAPPY!");
        }
        else{
             Map<Double, Integer> map = new TreeMap<Double, Integer>(Collections.reverseOrder());
            for (int i = 0; i < happyNums.size(); i++){
                normCheck(happyNums.get(i), map);
            }
            printMap(map);
        }
       
   }

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
       //HashSet<Integer> cycle = new HashSet<>();
       //List<String> normSum
       int tempNum = number; 
       double normSum = Math.pow(number,2);
       
       while (number != 1) {
            List<String> numStrList = Arrays.asList(String.valueOf(number).split(""));
            number = numStrList.stream().map(i -> Math.pow(Integer.parseInt(i), 2)).mapToInt(i -> i.intValue()).sum();
            normSum += Math.pow(number, 2);
       }
       double norm = Math.sqrt(normSum+1);
       map.put(norm,tempNum);
   }//method found on rosetta code to check to see if the numbers are happy

   public static void printMap(Map<Double, Integer> map){
    
        TreeMap<Double, Integer> newMap = map.entrySet().stream()
            .limit(10)
            .collect(TreeMap::new, (m, e) -> m.put(e.getKey(), e.getValue()), Map::putAll);

        for (Double key: newMap.keySet()) {
            System.out.println(newMap.get(key));
        }
    }
}
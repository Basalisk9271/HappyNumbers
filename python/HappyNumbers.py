#This is the file for HappyNumbers in Python
import math

def main() :
    num1 = int(input("First Argument: "))
    num2 = int(input("Second Argument: "))
    # take in arguments from command line
    if (num1 > num2) :
        num1,num2 = num2,num1
    # if the first number is larger than the second number, swap the numbers
    happyCount = 0
    normDict = {}
    current = int(num1)
    for x in range(num1, num2+1):
        if (isHappy(current) == True) :
            happyCount = happyCount + 1
            hapNum, norm = normCheck(current)
            normDict[str(hapNum)] = float(norm)
        current = current + 1
    # for loop to check if there any happy numbers in the range specified by the arguments
    if (happyCount == 0) :
        print("NOBODYS HAPPY!")
    else :
        printDict(normDict)
# main method

def isHappy(number) :
    cache = []
    sum = 0
    while (number != 1 ) :
        if (number in cache):
            return False
        cache.append(number)
        while (number != 0):
            digit = int(number % 10)
            sum = sum + digit**2
            number = float(number/10)
        number = number + sum
        sum = 0
    return True
# method found on rosetta code to check to see if the numbers are happy

def normCheck(number):
    sum = 0
    initialNumber = int(number)
    runningTotalForNorm = float((number**2)+1 )
    # List<String> normSum
    while (number != 1 ) :
        while (number != 0):
            digit = int(number % 10)
            sum = sum + digit**2
            number = float(number/10)
        number = number + sum
        runningTotalForNorm = runningTotalForNorm + (number**2)
        sum = 0
    norm = float(math.sqrt(runningTotalForNorm))
    return [initialNumber,norm]

def printDict(normDict) :
    sortedDictData = sorted(normDict.items(), key=lambda x: x[1], reverse=True)
    sortedDict = dict(sortedDictData)
    
    if (len(sortedDict) > 10):
        n = 10
        printTopTen = list(sortedDict.keys())[0:n]
        for x in range(len(printTopTen)):
            print(printTopTen[x])
            #print("\n")
    else:
        n = len(sortedDict)
        printTopTen = list(sortedDict.keys())[0:n]
        for x in range(len(printTopTen)):
            print(printTopTen[x])
            #print("\n")

main()

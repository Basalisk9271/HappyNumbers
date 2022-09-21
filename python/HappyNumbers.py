#This is the file for HappyNumbers in Python
import math

def main() : # main method
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


def isHappy(number) : # method based on the rosetta code function found for c# since I liked it a bit more than the one for Java
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


def normCheck(number): #function to get the norm of the number entered and return a tuple in [number, norm] format
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

def printDict(normDict) : #function to sort the dictionary and then print the top ten norms from it
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

main() #run the program

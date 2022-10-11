#!/usr/bin/perl

#Gabe Imlay
#CSC330: Organization of Programming Languages
#Project 1: Happy Numbers -> Perl
#October 7th, 2022

#This is a subroutine to check if a number is happy or not while returning either 
# -1 if the number is not happy or returning the norm value if the number is happy. 
sub isHappy {
    %cache = ();
    my $count = 0;
    my $number = shift;
    my $numDivisors = 0;
    my $sum = 0;
    my $norm = 0;
    my $digit;
    my $runningTotalForNorm = 1;
    while ($number != 1) {
        $runningTotalForNorm = $runningTotalForNorm + ($number*$number);
        if (exists($cache{$number})) {
            $norm = -1;
            return($norm);
        }
        $cache{$number} = $count;
        $count++;
        while ($number != 0){
            $digit = $number % 10;
            $sum = $sum + ($digit*$digit);
            $number = $number/10;
        }
        $number = $number + $sum;
        $sum = 0;
    }
    $norm = sqrt($runningTotalForNorm);
    return($norm);
}

#subroutine to call isHappy, store the norm and happy number in a hash and print 
#off the hash in descending nrom order. 
sub printHappy {
    %happyNums = ();
    my $happyCount = 0;
    my $num1 = shift;
    my $num2 = shift;
    for ( my $i=$num1; $i<=$num2; $i++  ) {
        if ( isHappy($i) != -1) {
            $happyCount++;
            my $normVal = isHappy($i);
            $happyNums{$i} = $normVal;
            #print $i . "---------" . $normVal . "\n";
        }
    }
    if ($happyCount == 0){
        print "NOBODYS HAPPY!\n";
    }
    else{
        my $count = 0;
        #This was a way to sort a hash by value and then have it print off the keys. I found this at 
        #https://stackoverflow.com/questions/10216419/sort-perl-hash-from-largest-to-smallest 
        #This was a response to someone's inquiry about sorting a hash in descending order. 
        foreach my $num (reverse sort {$happyNums{$a} <=> $happyNums{$b}} keys %happyNums) {
            if ($count < 10){
                print $num . "\n";
                $count++;
            }
            
        }
    }
    
}

# Here is the main program. This part of the program takes in the vales that the user wants 
# to find happy numbers between. 

print "First Number: ";
my $num1 = <STDIN>;
chomp($num1);
print "Second Number: ";
my $num2 = <STDIN>;
chomp($num2);
if ($num1 > $num2){
    ($num1, $num2) = ($num2, $num1);
}
printHappy($num1, $num2)
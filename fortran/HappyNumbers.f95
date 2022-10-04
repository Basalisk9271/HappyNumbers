!Gabe Imlay
!CSC330: Organization of Programming Languages
!Project 1: Happy Numbers -> Fortran
!October 7th, 2022


!Tutorials Point is where I found most of my structure and how to call different things
!https://www.tutorialspoint.com/fortran/index.htm 

PROGRAM HappyNumbers
    IMPLICIT NONE
    
    type KVPair !Struct to hold my happyNums and Norms values for printing
        integer :: happyNum
        real (kind = 8):: norm
    end type

    integer :: lowerBound, upperBound, temp, i
    real (kind = 8):: norm
    type(KVPair), dimension(10) :: happyArray

    write(*,"(A)",advance="no") "First Argument: "
    read *,lowerBound
    write(*,"(A)",advance="no") "Second Argument: "
    read *,upperBound

    if ( lowerBound > upperBound ) then
        temp = upperBound
        upperBound = lowerBound
        lowerBound = temp
    end if

    !Initialize array of structures
    do i = 1, 10
        happyArray(i)%happyNum = 0
        happyArray(i)%norm = 0
    end do

    do i = lowerBound, upperBound
        norm = isHappy(i)
        if (norm /= -1.0) then
            if ( norm > happyArray(10)%norm ) then
                happyArray(10)%happyNum = i
                happyArray(10)%norm = norm
            end if
            call Bubble_Sort(happyArray)
        end if
    end do

    !print off the sorted array while the number in happyNum is not 0 and the counter is less than 10
    !This is important because we only want the top 10 highest Norms
    !If there are no happy numbers in the range, print off "NOBODYS HAPPY!"
    if ( happyArray(1)%happyNum == 0 ) then
        write(*,"(A)",advance="yes") "NOBODYS HAPPY!"
    else
        do i = 1, 10
            if ( happyArray(i)%happyNum /= 0 ) then
                WRITE(*, '(i0)') happyArray(i)%happyNum
            end if
        end do
    end if
    

    contains
    
    !function that returns a norm if the number is happy, but returns -1 if the number is not happy
    !This helps so that it can be used in logic inside of my main
    real (kind = 8) function isHappy(param)
        IMPLICIT NONE
        integer :: number, sum, digit, param
        integer(kind = 8) :: temp
        real (kind = 8):: runningTotalForNorm, norm
        number = param  !  Creates local copy of paramter that can be changed since Fortran is pass by reference
        runningTotalForNorm = 1.0
        do while (number /= 1) 
            sum = 0 !have to change the sum back to zero when starting the loop
            temp = number ! convert number to temp
            temp = temp*temp
            runningTotalForNorm = runningTotalForNorm + temp  
            do while(number /= 0)
                digit = MOD(number, 10)
                sum = sum + (digit*digit)
                number = number/10
            end do
            number = number + sum
            if ( number == 4 ) then
                isHappy = -1.0
                exit
            end if
        end do
        norm = SQRT(REAL(runningTotalForNorm))
        runningTotalForNorm = 0
        if(number /= 4) then
            isHappy = norm
        end if 
    end function

    !This bubble sort is one found on Rosetta Code and tweaked to bubble sort my array of structs
    !found here https://rosettacode.org/wiki/Sorting_algorithms/Bubble_sort#Fortran
    SUBROUTINE Bubble_Sort(a)
        type(KVPair), DIMENSION(:) :: a
        type(KVPair) :: temp
        INTEGER :: i, j
        LOGICAL :: swapped
       
        DO j = SIZE(a)-1, 1, -1
          swapped = .FALSE.
          DO i = 1, j
            IF (a(i)%norm < a(i+1)%norm) THEN
              temp = a(i+1)
              a(i+1) = a(i)
              a(i) = temp
              swapped = .TRUE.
            END IF
          END DO
          IF (.NOT. swapped) EXIT
        END DO
      END SUBROUTINE
END PROGRAM HappyNumbers
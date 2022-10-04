PROGRAM HappyNumbers
    IMPLICIT NONE

    integer :: lowerBound, upperBound

    write(*,"(A)",advance="no") "First Argument: "
    read *,lowerBound
    write(*,"(A)",advance="no") "Second Argument: "
    read *,upperBound
    call printHappy(lowerBound, upperBound)

END PROGRAM HappyNumbers

    integer function isHappy(number)
        IMPLICIT NONE
        integer, intent(in):: number
        integer :: numDivisors, i
        numDivisors = 0
        do i = 1, number+1
            
        end do
        

    end function isHappy
    
    subroutine printHappy(lowerBound, upperBound) 
        IMPLICIT NONE
        integer, intent(in) :: lowerBound, upperBound
        integer :: i
        logical :: isPrime
        do i = lowerBound, upperBound
            if (isPrime(i)) then
                WRITE(*, '(i0)') i
            end if            
        end do
        

    end subroutine printHappy
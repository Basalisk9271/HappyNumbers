!This is my Fortran code for my HappyNumbers Project
!Tutorials Point is where I found most of my structure and how to call different things
!https://www.tutorialspoint.com/fortran/index.htm 

PROGRAM HappyNumbers
    IMPLICIT NONE
    
    type KVPair
        integer :: happyNum
        real :: norm
    end type

    integer :: lowerBound, upperBound, temp, i
    !real :: norm
    type(KVPair), dimension(10) :: happyArray

    write(*,"(A)",advance="no") "First Argument: "
    read *,lowerBound
    write(*,"(A)",advance="no") "Second Argument: "
    read *,upperBound
    !call printHappy(lowerBound, upperBound)

    if ( lowerBound > upperBound ) then
        temp = upperBound
        upperBound = lowerBound
        lowerBound = temp
    end if

    do i = 1, 10
        happyArray(i)%happyNum = 0
        happyArray(i)%norm = 1.0
    end do

    do i = 1, 10
        WRITE(*, '(i0)') happyArray(i)%happyNum
        WRITE(*, '(F0.6)') happyArray(i)%norm
    end do




END PROGRAM HappyNumbers

    integer function isHappy(number)
        IMPLICIT NONE
        integer, intent(in):: number
        integer :: numDivisors, i
        numDivisors = 0
        do i = 1, number+1
            
        end do
        isHappy = numDivisors

    end function isHappy
    
    !subroutine printHappy(happyArray) 
     !   IMPLICIT NONE
      !  type(KVPair), intent(in) :: happyArray(10)
       ! integer :: i
        !logical :: isPrime
        !do i = lowerBound, upperBound
         !   if (isPrime(i)) then
          !      WRITE(*, '(i0)') i
           ! end if            
        !end do
        

    !end subroutine printHappy
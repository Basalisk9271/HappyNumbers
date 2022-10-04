!This is my Fortran code for my HappyNumbers Project
!Tutorials Point is where I found most of my structure and how to call different things
!https://www.tutorialspoint.com/fortran/index.htm 

PROGRAM HappyNumbers
    IMPLICIT NONE
    
    type KVPair
        integer :: happyNum
        real :: norm
    end type

    type Node
        integer :: key
        type(Node), pointer :: next => null ()
    end type

    integer :: lowerBound, upperBound, temp, i
    real :: norm
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

    do i = lowerBound, upperBound

        if (isHappy(i) /= -1) then
            norm = isHappy(i)
            if ( norm > happyArray(9)%norm ) then
                happyArray(9)%happyNum = i
                happyArray(9)%norm = norm
            end if
            call Bubble_Sort(happyArray)
        end if
    end do

    do i = 1, 10
        WRITE(*, '(i0)') happyArray(i)%happyNum
        WRITE(*, '(F0.6)') happyArray(i)%norm
    end do

    contains
    real function isHappy(number)
        IMPLICIT NONE
        integer(kind = 8), dimension (:), allocatable :: cache
        integer, intent(in):: number
        integer(kind = 8) :: temp
        integer :: i, sum

        do while () 

        end do
    end function isHappy

    !This bubble sort is one found on Rosetta Code and tweaked to bubble sort my array of structs
    SUBROUTINE Bubble_Sort(a)
        type(KVPair), INTENT(in out), DIMENSION(:) :: a
        type(KVPair) :: temp
        INTEGER :: i, j
        LOGICAL :: swapped
       
        DO j = SIZE(a)-1, 1, -1
          swapped = .FALSE.
          DO i = 1, j
            IF (a(i)%norm > a(i+1)%norm) THEN
              temp = a(i)
              a(i) = a(i+1)
              a(i+1) = temp
              swapped = .TRUE.
            END IF
          END DO
          IF (.NOT. swapped) EXIT
        END DO
      END SUBROUTINE Bubble_Sort
END PROGRAM HappyNumbers
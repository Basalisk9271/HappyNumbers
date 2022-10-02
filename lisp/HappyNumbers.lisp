#!/usr/bin/sbcl --script
;;; Here is the function to print the prime numbers
(defun printprimes (num1 num2)
  (loop for i from num1 to num2 by 1 do
        ( when (isprime i) (print i) )
        )
  (terpri)
  )

;;; Here is the function to determine if a number is prime
(defun isprime ( num )
  (let (( numDivisors 0))
    (loop for i from 1 to num by 1 do
          ( when ( = (mod num i) 0 )
                 ( setf  numDivisors (+ numDivisors 1))
                 )
          )
    ;;; This last function should return true for primes
    (= numDivisors 2)
    )
  )


;;; Here is the main program
(progn
  ;;; Let's define variables to avoid compiler warnings
  (defvar num1)
  (defvar num2)
  (princ "Enter the first number:")
  (terpri)
  (setf num1 (read))
  (princ "Enter the second number:")
  (terpri)
  (setf num2 (read))
  (printprimes num1 num2)
  )

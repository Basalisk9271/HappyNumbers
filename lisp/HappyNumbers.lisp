#!/usr/bin/sbcl --script

;Gabe Imlay
;CSC330: Organization of Programming Languages
;Project 1: Happy Numbers -> Lisp
;October 7th, 2022

(defstruct (KVPair(:constructor create-kvpair))
  happynum
  norm
)

;;; Here is the function to determine if a number is prime
(defun ishappy ( param )
  defvar number temp digit sum runningTotalForNorm
  defvar norm
  (setf number param)
  (setf runningTotalForNorms 1)
  (loop while (!= number 1)
    do()  
  )
)


;;; Here is the main program
(progn
  ;;; Let's define variables to avoid compiler warnings
  (defvar num1)
  (defvar num2)
  (defvar newpair)
  (defvar happyarray)
  (princ "Enter the first number:")
  (terpri)
  (setf num1 (read))
  (princ "Enter the second number:")
  (terpri)
  (setf num2 (read))
  (if (> num1 num2)
    (rotatef num1 num2)
  ) 
  (setq newpair (create-kvpair :happynum 0 :norm 0))
  ;(write newPair)
  (terpri)
  (setf happyarray (make-array '(10)))
  (loop for x from 0 to 9
    do(setf (aref happyarray x) (create-kvpair :happynum 0 :norm 0))
  )
  )

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
  (let (number temp digit sum runningTotalForNorm norm)
  (setq number param)
  (setq runningTotalForNorm 1)
  (loop while (/= number 1)
    do
      (setq sum 0)
      (setq temp number)
      (setq temp (* temp temp))
      (setq runningtotalfornorm (+ runningtotalfornorm temp))
      (loop while (/= number 0 )
        do 
          (setq digit (mod number 10))
          (setq sum (+ sum (* digit digit)))
          (setq number (floor number 10))
      )
      (setq number (+ number sum))
      (if (= number 4)
        (return-from isHappy -1)
      )  
  )
  (setq norm (sqrt runningtotalfornorm))
  norm
  )
)


;;; Here is the main program
(progn
  ;;; Let's define variables to avoid compiler warnings
  (defvar num1)
  (defvar num2)
  (defvar newpair)
  (defvar newpair2)
  (defvar happyarray)
  (princ "Enter the first number: ") (finish-output)
  (setf num1 (read))
  (princ "Enter the second number: ") (finish-output)
  (setf num2 (read))
  (if (> num1 num2)
    (rotatef num1 num2)
  ) 
  (loop for x from num1 to num2
    do
      (if (/= (ishappy x) -1)
        (pprint x)
      )  )
  (terpri)
  )


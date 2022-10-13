#!/usr/bin/sbcl --script

; Gabe Imlay
; CSC330: Organization of Programming Languages
; Project 1: Happy Numbers -> Lisp
; October 7th, 2022

; Tutorials Point is where I found most of my structure and how to call different things
; https://www.tutorialspoint.com/lisp/index.htm

; These are global arrays so that it can be seen by my bubbleSort function. 
(defvar happyNums)
(defvar norms)

; This is my isHappy function that is almost word for word translated from my go code. 
(defun isHappy ( param )
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

; This is a buble sort that I found on https://blog.krybot.com/a?ID=01550-cc1fd9c5-8d8b-4a91-b703-69c2a2434561
; and modified to suit my needs.
(defun bubbleSort ()
  (dotimes(i(1-(length norms)) norms)
    (dotimes(j(-(length norms) i 1))
      (if(<(aref norms j)(aref norms(+ 1 j)))
        (progn
        (rotatef (aref happyNums j)(aref happyNums(+ 1 J)))
        (rotatef (aref norms j)(aref norms(+ 1 J))))))))


;;; Here is the main program
(progn
  (defvar num1)
  (defvar num2)
  (defvar newpair)
  (defvar newpair2)
  
  ; Set the array sizes so that they have memory
  (setf happyNums (make-array '(10)))
  (setf norms (make-array '(10)))

  (princ "Enter the first number: ") (finish-output)
  (setf num1 (read))
  (princ "Enter the second number: ") (finish-output)
  (setf num2 (read))
  (if (> num1 num2)
    (rotatef num1 num2)
  ) 
  
  ; If number 1 is 0, skip to 1 so it does not break the program logic
  (if (= num1 0)
    (setq num1 (+ num1 1))
  ) 

  ; Initializes my arrays with zeros in them 
  (loop for x from 0 to 9
    do
      (setf (aref happyNums x) 0)
      (setf (aref norms x) 0)
  )

 

; This is a loop to go through all of the numbers between te input values and check to see if there are happy numbers present
  (loop for x from num1 to num2
    do
      (if (/= (isHappy x) -1)
        (progn
          
          (if (> (isHappy x) (aref norms 9))
          (progn
            (setf (aref happyNums 9) x)
            (setf (aref norms 9) (isHappy x))
            
          )
          )
          (bubbleSort ))
      )
  )
  
  ; Next is the loops to print my happyNums or display "NOBODYS HAPPY!" if there are no happy numbers
  (if (= (aref happyNums 0) 0)
  (progn
          (princ "NOBODYS HAPPY!")
          (terpri))
  (progn
    (loop for x from 0 to 9
      do
        (if(/= (aref happyNums x) 0)
          (progn
          (princ (aref happynums x))
          (terpri)))) 
        ))
        

  )


#lang racket

(define (even? x) (= (remainder x 2) 0))

; Recursive procedure linear iterative process
; which multiplies two numbers; 'a' and 'b'
; that takes a number of steps that is
; logarithmic in 'b'
(define (multiply x y)
  
  (define (double x) (+ x x))
  
  (define (halve x) (/ x 2))
  
  (define (iter a b sum)
    (cond ((= b 0) sum)
          ((even? b)
           (iter (double a) (halve b) sum))
          (else (iter a (- b 1) (+ sum a)))))
  
  (iter x y 0))
;> (multiply 2 25)
;> (iter 2 25 0)
;> (iter 2 24 2)
;> (iter 4 12 2)
;> (iter 8 6 2)
;> (iter 16 3 2)
;> (iter 16 2 18)
;> (iter 32 1 18)
;> (iter 32 0 50)
;> 50
; Using this procedure to multiply 2 and 25
; took only 8 steps, O(log(n)), and 3 state variables in
; constant space, O(1); a b and sum. Whereas the
; example provided for excercise 1.17 computed multiplication
; that took a number of steps that was linear in the number
; to multiply the first number by, O(n); and required space that
; grew linearly as well, O(n).
; This difference becomes evident for larger inputs, multiplying
; 2 and 25 took only 8 steps and req. 3 state variables, doing so
; with a linear recursive process without doubling and halving would
; have took 25 steps and req. 25 state variables.
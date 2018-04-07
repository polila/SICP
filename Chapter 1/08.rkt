#lang racket

; Given:
; - Newton's method for cube roots
; - If 'y' is an approx. to the cube root of 'x',
;   then a better approx. is given by the value;
;   (/ (+ (/ x (* y y)) (* 2 y)) 3)

(define (abs a)
    (if (< a 0)
        (- a)
        a))

(define (square x)
  (* x x))
         
(define (cube x)
  (define (improve y)
    (/ (+ (/ x (square y)) (* 2 y)) 3))
  (define (good-enough? y)
    (< (abs (- (* y y y) x)) 0.00001)) 
  (define (cube-iter y)
    (if (good-enough? y)
        y
        (cube-iter (improve y))))
  (cube-iter 1.0))
;> (cube 8) = 2.0
;> (cube 27) = 3.0
;> (define n 4)
;> (< (- (cube (* n n n)) n) 0.001) = #t
;> (cube 125) = 5.0

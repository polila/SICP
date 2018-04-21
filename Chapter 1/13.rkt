#lang racket
; Ex. 1.12
; Prove Fib(n) is the closest integer to (/ (expt (/ (+ 1 (sqrt 5)) 2) n) (sqrt 5))
(define (fib n)
  (define (fib-iter i j count)
    (if (= count 0)
        j
        (fib-iter (+ i j) i (- count 1))))
  (fib-iter 1 0 n))

(define (abs a)
  (if (< a 0)
      (- a)
      a))

(define (sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs(- (* guess guess) x)) 0.001))
  (define (improve guess)
    (/ (+ (/ x guess) guess) 2))
  (sqrt-iter 1.0))

(define golden-ratio (/ (+ 1 (sqrt 5)) 2))

(define (is-close n)
  (< (- (fib n) (/ (expt golden-ratio n) (sqrt 5))) 1.0))
;> (is-close 5)
;> #t
;> (is-close 4)
;> #t
;> (is-close 3)
;> #t
;> (is-close 2)
;> #t
;> (is-close 1)
;> #t
;> (is-close 0)
;> #t

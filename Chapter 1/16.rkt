#lang racket

; linear iterative process

(define (square x) (* x x))

(define (even? x) (= (remainder x 2) 0))

(define (expt x n)
  (define (iter a b count)
    (cond ((= count 0) a)
          ((even? count)
           (iter a
                 (square b)
                 (/ count 2)))
          (else (iter (* b a)
                      (* a x)
                      (- count 1)))))
  (iter 1 x n))


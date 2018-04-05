#lang racket

(define (square a) (* a a))

(define (f a b c)
  (define (max-iter x y z sum count)
    (cond ((= count 2) sum)
          ((> x y) (max-iter z y z (+ sum (square x)) (+ count 1)))
          (else (max-iter x z z (+ sum (square y)) (+ count 1)))))
  (max-iter a b c 0 0))
         
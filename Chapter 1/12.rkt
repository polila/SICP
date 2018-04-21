#lang racket
; Ex. 1.12
; A procedure that computes the term (n,k)
; from Pascal's triagle in a recursive process
(define (pascal n k)
  (if (or (= k 0)(= n k))
      1
      (+ (pascal (- n 1) (- k 1))
         (pascal (- n 1) k))))
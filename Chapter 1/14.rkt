#lang racket
; Ex. 1.14
; Procedure provided from text to compute the
; permutation of ways to count change given an amount.
; The number of ways to change amount 'a' using 'n' kinds
; of coins equals:
; - the number of ways to change amound 'a' using all but the first
;   kind of coin, plus
; - the number of ways to change amount 'a' minus 'd' using all 'n'
;   kinds of coins where 'd' is the denomination of the first
;   first kind of coin.
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
;> (count-change 11)
;> (cc 11 5)
;> (+ (cc 11 4)(cc -39 5))
;> (+ (+ (cc 11 3)(cc -14 4))0)
;> (+ (+ (+ (cc 11 2)(cc 1 3)) 0) 0)
;> (+ (+ (+ (+ (cc 11 1)(cc 6 2))(+ (cc 1 2)(cc -9 3))) 0) 0)
;> (+ (+ (+ (+ 1 (+ (cc 6 1)(cc 1 2)))(+ (+ (cc 1 1)(cc -4 2)) 0)) 0) 0)
;> (+ (+ (+ (+ 1 (+ 1 (+ (cc 1 1)(cc -4 2))))(+ (+ 1 0) 0)) 0) 0)
;> (+ (+ (+ (+ 1 (+ 1 (+ (+ (cc 1 0)(cc 0 1)) 0)))(+ (+ 1 0) 0)) 0) 0)
;> (+ (+ (+ (+ 1 (+ 1 (+ (+ 0 1) 0)))(+ (+ 1 0) 0)) 0) 0)
;> (+ (+ (+ (+ 1 (+ 1 (+ (1) 0)))(+ (1) 0)) 0) 0)
;> (+ (+ (+ (+ 1 (+ 1 (1)))(1)) 0) 0)
;> (+ (+ (+ (+ 1 (2)) 1) 0) 0)
;> (+ (+ (+ (3) 1) 0) 0)
;> (+ (+ 3 1) 0)
;> (+ 3 1)
;> (4)
; The procedure is a tree recursion
; Orders of growth;
; - space increases linearly since growth is dependent
;   on how many times the smallest denomination can
;   divide the amount.
; - time increases exponentially because each step
;   to compute how many times a denomination can divide an amount
;   grows linearly, and every step requires 2 steps
;   (i.e., (cc 11 4) = (cc 11 3) + (cc -14 3)
; Thus, space grows in O(n) and time in O(n^2)
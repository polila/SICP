#lang racket
; Ex. 1.21

(define (square x) (* x x))
(define (divides? a x) (= (remainder a x) 0))
(define (find-divisor n d)
  (cond ((> (square d) n) n)
        ((divides? n d) d)
        (else (find-divisor n (+ d 1)))))
(define (smallest-divisor x)
  (find-divisor x 2))
(define (prime? x)
  (= x (smallest-divisor x)))

;> (map (lambda (i)
;>        (if (prime? i)
;>            (string #\p #\r #\i #\m #\e)
;>            (smallest-divisor i)))
;>      '(199 1999 19999))
;> ("prime" "prime" 7)
#lang racket
; Ex. 1.17
; Integer multiplication by means of repeated addition from textbook,
; the time and space grows linear with b, O(n).
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

; A linear recursive process multiplication procedure
; which uses a logarithmic number of steps, O(log(n)).
(define (double x) (+ x x))

(define (even? x) (= (remainder x 2) 0))

(define (multiply a b)
  (cond ((= b 1) a)
        ((even? b) (double(multiply a (/ b 2))))
        (else (+ a (multiply a (- b 1))))))
;> (multiply 2 5)
;> (+ 2 (multiply 2 4))
;> (+ 2 (double (multiply 2 2)))
;> (+ 2 (double (double (multiply 2 1))))
;> (+ 2 (double (double (2))))
;> (+ 2 (double 4))
;> (+ 2 (8))
;> (10)
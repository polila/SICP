#lang racket

; Ex. 1.19
; From text, procedure to compute
; the Fibonacci numbers in a logarithmic number
; of steps
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (square x) (* x x))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   ; Reference: http://community.schemewiki.org/?sicp-ex-1.1
                   (+ (square p) (square q)) ; compute p'
                   (+ (* 2 p q) (square q)) ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

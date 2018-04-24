#lang racket
; Section 1.2.6 Testing for Primality
; Additional reference: https://artofproblemsolving.com/wiki/index.php?title=Prime_number
(define (square x) (* x x))
; Procedure from text to test if a number, 'n' is prime.
; It does this by finding its divisors (greater than 1) by testing
; if 'n' is divisible by sucessive integers starting with 2.
; This procedures number of steps to identify whether n is prime
; will have order of growth O(sqrt(n)).
(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor number divisor)
    (define (divides? a x)
      (= (remainder a x) 0))
    (cond ((> (square divisor) number) number)
          ((divides? number divisor) divisor)
          (else (find-divisor number (+ divisor 1)))))
  (= n (smallest-divisor n)))


; Fermat's Little Theorem: If 'n' is prime and 'a' is any
; positive integer less than 'n', than 'a' raised to the nth
; power is congruent to 'a' modulo 'n'
; Two numbers are said to be congruent modulo 'n' if they both
; have the same remainder when divided by 'n'.
(define (fermat-theorem n)
  ; Procedure to compute the exponential of a number modulo another number.
  (define (expmod base exp number)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (square (expmod base (/ exp 2) number))
                    number))
          (else (remainder (* base (expmod base (- exp 1) number))
                         number))))
  ; Procedure to check if the remainder modulo n of the nth power
  ; of 'a' is equal to 'a' by generating a random
  ; number between [1,n-1].
  (define (fermat-test n)
    (define (try-it a)
      (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
  ; Procedure to run test 10 times, 'a' is prime if test succeeds everytime
  (define (iter a count)
    (cond ((= count 10) #t)
          ((fermat-test a) (iter n (+ count 1)))
          (else #f)))
  (iter n 0))

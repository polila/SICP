#lang racket

(define (prime? x)
  (define (find-divisor d)
    (cond ((> (* d d) x) x)
          ((= (remainder x d) 0) d)
          (else (find-divisor (+ d 1)))))
  (= x (find-divisor 2)))
; Ex. 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-milliseconds) start-time) (* (- (current-milliseconds) start-time) 1000))
      (void)))
(define (report-prime millseconds microseconds)
  (display " *** ")
  (display millseconds)
  (display " ")
  (display microseconds))

(define (search-for-primes start)
  (define (iter n count)
    (cond ((= count 3) (void))
          ((prime? n)
           (timed-prime-test n)
           (iter (+ n 1) (+ count 1)))
          (else (iter (+ n 1) count))))
  (display "number *** Milliseconds Microseconds")
  (iter start 0))       
;> (search-for-primes 1000) 1 thousand
;> 1009 *** 0
;> 1013 *** 0
;> 1019 *** 0
;> (search-for-primes 10000)10 thousand
;> 10007 *** 0
;> 10009 *** 0
;> 10037 *** 0
;> (search-for-primes 100000) 100 thousand
;> 100003 *** 0
;> 100019 *** 0
;> 100043 *** 0
;> (search-for-primes 1000000) 1 million
;> 1000003 *** 0
;> 1000033 *** 0
;> 1000037 *** 0
;> (search-for-primes 10000000000) 10 billion 
;> number *** Milliseconds Microseconds
;> 10000000019 *** 5 5000
;> 10000000033 *** 5 5000
;> 10000000061 *** 4 4000
;> (search-for-primes 1000000000000) 1 trillion
;> number *** Milliseconds Microseconds
;> 1000000000039 *** 43 43000
;> 1000000000061 *** 46 46000
;> 1000000000063 *** 44 44000
; The time difference in finding the three smallest primes
; larger than 10 billion and 1 trillion did indeed take
; rougly sqrt(100) longer ~ almost 10x
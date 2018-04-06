#lang racket

; Given:
; - (define (good-enough? guess x)
;    (< (abs (- (square guess) x)) 0.001))
; - Not effective for finding square roots of very small numbers
; - Computers perform arithmetic operations w/limited precision
;   * This makes the test inadequate for very large numbers
; - Watch how guess changes from one iteration to the next and
;   to stop when the change is a very small fraction of the guess

; Task:
; - Show examples explaining how the test fails for small and large numbers
; - Design a procedure to stop the iteration when the change is a very small
;   fraction of the guess

;(define (sqrt x)
;  (define (abs a)
;    (if (< a 0)
;        (- a)
;        a))
;  (define (improve guess)
;    (/ (+ guess (/ x guess)) 2))
;  (define (good-enough? guess)
;  (< (abs (- (* guess guess) x)) 0.001))
;  (define (sqrt-iter guess)
;    (if (good-enough? guess)
;        guess
;        (sqrt-iter (improve guess))))
;  (sqrt-iter 1.0))

;> (sqrt 0.001) = 0.0412 != 0.0316
;> (sqrt 0.002) = 0.0501 != 0.0447
;> (sqrt (expt 2 64) = 4294967296.0 == 4,294,967,296

(define (sqrt x)
  (define (abs a)
    (if (< a 0)
        (- a)
        a))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (define (good-enough? guess)
  (< (abs (- (* guess guess) x)) 0.00001))
;> 0.00001 < 0.001, good-enough? will be true for very small changes of guess when
;> the difference of the new guess and old is less then a hundred thousands
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
;> (sqrt 0.001) = 0.0316
;> (sqrt 0.002) = 0.0447
;> (sqrt (expt 2 100)) = 1125899068 == 1.125899907 * 10^100 (calculator)
;> the adjustment in guess works better for smaller numbers,
;> precision for larger numbers did not change. Perhaps I did not test
;> numbers big enough...
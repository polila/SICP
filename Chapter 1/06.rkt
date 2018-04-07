#lang racket

;(define (square x) (* x x))

;(define (abs x) (< x 0) (- x) x)

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

;(define (average a b)
;  (/ (+ a b) 2))

;(define (improve guess x)
;  (average guess (/ x guess)))

;(define (sqrt-iter guess x)
;  (cond ((good-enough? guess x) guess)
;        (else (sqrt-iter (improve guess x) x))))

;(define (sqrt x)
;  (sqrt-iter 1.0 x))
;(sqrt 2)
;> 1.0
;> Since cond is a procedure and due to the applicative order of evaluation,
;> the new-if expressed in terms of cond - results all subexpressions being
;> evaluated. Hence, which is why the result of (sqrt 2) was 1.0 because
;> the consequent of the first predicate to the cond (new-if) was invoked.
;> To test my hypothesis;
;(define (sqrt x)
;  (define (improve guess)
;    (/ (+ guess (/ x guess)) 2))
;  (define (good-enough? guess)
;    (< (abs (- (* guess guess) x)) 0.001))
;  (define (sqrt-iter guess)
;    (if (good-enough? guess)
;        guess
;        (sqrt-iter (improve guess))))
;  (sqrt-iter 1.0))
;(* (sqrt 2) (sqrt 2))
;> 2.000006007
; It is indeed the fact that the conditional if
; needs to be provided as a special form. 
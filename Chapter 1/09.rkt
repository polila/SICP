#lang racket

;(define (inc x) (+ 1 x))
;(define (dec x) (- x 1))

;(define (+ a b)
;  (if (= a 0)
;      b
;      (inc (+ (dec a) b))))
;> (+ 4 5)
;> (+ 1 ((- 4 1) 5)
;> (+ 1 (+ 1 ((- 3 1) 5)))
;> (+ 1 (+ 1 (+ 1 ((- 2 1) 5))))
;> (+ 1 (+ 1 (+ 1 (+ 1 ((- 1 1) 5)))))
;> (+ 1 (+ 1 (+ 1 (+ 1 (0 5)))))
;> (+ 1 (+ 1 (+ 1 (+ 1 5))))
;> (+ 1 (+ 1 (+ 1 6)))
;> (+ 1 (+ 1 7))
;> (+ 1 8)
;> 9
;> Recursive procedure and process

;(def (+ a b)
; (if (= a 0)
;      b
;      (+ (dec a) (inc b))))
;> (+ 4 5)
;> (+ (- 4 1) (+ 5 1))
;> (+ (- 3 1) (+ 6 1))
;> (+ (- 2 1) (+ 7 1))
;> (+ (- 1 1) (+ 8 1))
;> (+ (0) (9))
;> 9
;> Recursive procedure iterative process
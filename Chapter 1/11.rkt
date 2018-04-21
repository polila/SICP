#lang racket
; Recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; Iterative process
(define (f-iter x)
  (define (iter i j k count)
    (if (< count 3)
        i
        (iter (+ i (* 2 j) (* 3 k)) i j (- count 1))))
  (if (< x 3)
      x
      (iter 2 1 0 x)))
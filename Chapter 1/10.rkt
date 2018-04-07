#lang racket

; Ackermann function
; - A total computable function
; - Not primitive recursive (i.e., +, /, n!, f(n)-->{nth prime} etc.)
; - All primitive recurive functions are total and computable,
;   but the Ackermann function shows that not all total computable functions
;   are primitive recursive

; References:
; - http://mathworld.wolfram.com/AckermannFunction.html
; - https://en.wikipedia.org/wiki/Ackermann_function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

;> (A 1 10)
;> (A 0 (A 1 9))
;> (A 0 (A 0 (A 1 8)))
;> (A 0 (A 0 (A 0 (A 1 7))))
;> (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1...(A 1 1))))))))))
;> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1...(A 0 (2)))))))))
;> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1...(A 0 (4)))))))
;> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1...(A 0 (8))))))
;> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1...(A 0 (16))))
;> (A 0....(A 0 (32)))))
;> (A 0 (512))
;> 1024:= 2^10

;> This function is expressed as a recursive procedure
;> and its process is linear recursive. 

;> (A 2 4)
;> (A 1 (A 2 3))
;> (A 1 (A 1 (2 2)))
;> (A 1 (A 1 (A 1 (A 2 1))))
;> (A 1 (A 1 (A 1 (2))))
;> (A 1 (A 1 (A 0 (A 1 1))))
;> (A 1 (A 1 (A 0 (2)))) ; A(0 2):= 2^2
;> (A 1 (A 1 (4)))
;> (A 1 (A 0 (A 1 3)))
;> (A 1 (A 0 (A 0 (A 1 2))))
;> (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;> (A 1 (A 0 (A 0 (A 0 (2)))))
;> (A 1 (A 0 (A 0 (4))))
;> (A 1 (A 0 (8)))
;> (A 1 (16))
;> (A 1 y):= 2^y
;> (A 1 16):= 2^16 = A(2 4)<|==|>A(1 4*4):= A(1 (* y y))= 2^(y^2)
;> 65536:= 2^16

;> (A 3 3)
;> (A 2 (A 3 2)) 
;> (A 2 (A 2 (A 3 1)))
;> (A 2 (A 2 (2))) | (A 2 4)<|==|>(A 1(* 4 4)) | (A 2 y) <|==|> (A 1 (* y y)) | assumed generalization
;> (A 2 (A 1 4))
;> (A 2 16)
;> (A 1 256):= 2^256
;> ....LOL nvm
;> (A 2 (A 2 (2)))
;> (A 2 (A 1 (A 2 1)))
;> (A 2 (A 1 (2)))
;> (A 2 (4)) | assumed generalization is incorrect, hence: (A 1 (* y y)) != (A 2 y)
;> (A 3 3) = (A 2 4) = 2^16
;> 65536

;(define (f n) (A 0 n))
;> (A x y):= 2y -> x -> 0
;> (f n):= 2n

;(define (g n) (A 1 n))
;> (A 1 n)
;> (A 0 (A 1 (- n 1)))
;> (A 0 (A 0 (A 1 (- n 2))))
;> (A 0 ...................(A 1 (- n k)))
;> (A x y):= (* 2 y) -> x = 0 | (A x y):= 2 -> y = 1
;> (g n):= 2^n

;(define (h n) (A 2 n))
;> (A 2 1):= 2
;> (A 2 2):= 4 = 2^2
;> (A 2 3):= 16 = 2^4
;> (A 2 4):= 65536 = 2^16 <|==|> 2^(A 2 3)
;> (A 2 y):= 2^(A 2,(- y 1))
;> (h n):= 2^(h (- n 1))
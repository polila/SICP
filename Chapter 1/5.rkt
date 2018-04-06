#lang racket

;(define (p) (p))

;(define (test x y)
; (if (= x 0)
;      0
;      y))

;(test 0 (p))

;> Under the applicative order of evaluation, the evaluation process
;> is called/performed on each element. So (p) will be executed,
;> which is a procedure that invokes itself, hence test will be not
;> terminate due to (p).
;> Likewise, under normal order evaluation, operands are deferred
;> until their values are needed so y will not be called and the
;> result of test will be 0.
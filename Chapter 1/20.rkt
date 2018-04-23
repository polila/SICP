#lang racket

; Ex. 1.20
(define (GCD x y)
  (define (euclid a b)
    (if (= b 0)
        a
        (euclid b (remainder a b))))
  (if (> y x)
      (euclid y x)
      (euclid x y)))

; Applicative order evaluation
;> (GCD 206 40) ; count = 0
;> (euclid 206 40)
;> (euclid 40 (remainder 206 40)) ; count = 1
;> (euclid 40 (6)) 
;> (euclid 6 (remainder 40 6)) ; count = 2
;> (euclid 6 (4))
;> (euclid 4 (remainder 6 4)) ; count = 3
;> (euclid 4 (2))
;> (euclid 2 (remainder 4 2)) ; count = 4
;> (euclid 2 (0))
;> 2
; Under the applicative order evaluation,
; the GCD procedure computes 4 remainder operations
; for GCD(206 40)

; Normal order evaluation - evaluation of procedure
; arguments are delayed until they are needed
; Reference: http://community.schemewiki.org/?sicp-ex-1.20
;> (GCD 206 40)
;> (euclid 206 40)
;> (if (= 40 0)
;>     #f
;>     (euclid 40 (remainder 206 40))) ; count = 0
;> (if (= (remainder 206 40) 0) ; count = 1
;>     #f
;>     (euclid (remainder 206 40) (remainder 40 (remainder 206 40)))) ; count = 1
;> (if (= (remainder 40 (remainder 206 40)) 0) ; count = 1 + 2
;>     #f
;>     (euclid (remainder 40 (remainder 206 40))
;>             (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; count = 3
;> (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; count = 3 + 4
;>     #f
;>     (euclid (remainder (remainder 206 40)
;>                        (remainder 40 (remainder 206 40)))
;>             (remainder (remainder 40 (remainder 206 40))
;>                        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))) ; count = 7
;> (if (= (remainder (remainder 40 (remainder 206 40))
;>                        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ; count = 7 + 7 = 14
;>        0)
;>     #t
;>     (= a (remainder
;>           (remainder 206 40) (remainder 40(remainder 206 40))) ; count = 4
; Total remainder operations is 14 when the predicate (= b 0) is evaluated,
; and 4 after the consequent a computed when (= b 0) is #t.
; Thus under the normal order evaluation, it took 18 remainder operations to
; compute GCD for GCD(206 40).


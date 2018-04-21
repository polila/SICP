#lang racket
; Ex. 1.15
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
; a.
;> (sine 12.15)
;> angle must be less than 0.1 for 'p' to be applied
;> since 'p' is applied after the expression is done expanding
;> and angle is divided by 3.0 at every step, then;
;> 12.5 < 0.1(3^n)
;> log(125)/log(3) < n
;> 4.39 < n <= 5
;> (p (sine (/ 4.1667 3.0)))
;> (p (p (sine (/ 1.3889 3.0))))
;> (p (p (p (sine (/ 0.4629 3.0)))))
;> (p (p (p (p (sine (/ 0.15 3.0))))))
;> (p (p (p (p (p (sine 0.05))))))
;> (p (p (p (p (p 0.05)))))
;> (p (p (p (p 0.1495))))
;> (p (p (p 0.4351)))
;> (p (p 0.9758))
;> (p -0.7896)
;> -0.3998
;> So the procedure 'p' is applied 5 times when (sine 12.15) is evaluated

; b.
;> The order of growth in space is logarithmic since
;> 'p' is applied when the argument for sine is less than 0.1,
;> but the number of times 'p' will be applied is dependent
;> on how many times it will take '3' to divide the argument in sine
;> for it to be less than 0.1, hence;
;> log(a)/log(3) rounded up to the nearest integer.

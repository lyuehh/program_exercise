(define (abs x)
   (cond ((> x 0) x)
         ((= x 0) 0)
         ((< x 0) (- x))))

(define (sequare x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
    (improve guess x)
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? old_guess new_guess)
  (> 0.01
     (/ (abs (- new_guess old_guess))
        old_guess)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


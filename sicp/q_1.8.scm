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

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x))
     0.001))

(define (improve guess x)
  (/ (+ (/ x (sequare guess)) (* 2 guess))
     3))

(define (cube x)
  (* x x x))

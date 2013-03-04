(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))

(define (abs3 x)
  (if (< x 0)
    (- x)
    x))


(and (> x 5) (< x 10))

(define (>= x y)
  (or (> x y) (= x y)))

(define (>= x y)
  (not (< x y)))

(5+4+(2-(3-(6+(4/5)))))/((3*(6-2)*(2-7)))

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

(define (sum-of-bigger x y z)
  (cond ((and (< x y) (< x z)) (+ y z))
        ((and (< y z) (< y x)) (+ x z))
        ((and (< z x) (< z y)) (+ x y))))

(define (sequare x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (sequare guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

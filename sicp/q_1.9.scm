(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

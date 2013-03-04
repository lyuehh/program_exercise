(define (factor n)
  (if (= n 1)
    1
    (* n (factor (- n 1)))))

(define (factor2 n)
  (factor-iter 1 1 n))

(define (factor-iter product counter max-count)
  (if (> counter max-count)
    product
    (factor-iter (* product counter) (+ counter 1) max-count)))

(define (factor2 n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* product counter) (+ counter 1))))
  (iter 1 1))

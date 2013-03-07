(define (fib n)
  (if (< n 2)
    1
    (+ (fib (- n 1))
       (fib (- n 2)))))

;(fib 40)

(println 'xx')
(println (fib 10))
(exit)

(define (x a) (println a))

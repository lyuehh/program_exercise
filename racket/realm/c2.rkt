#lang racket

;(quotient 10 3) -> 3 整除
;(remainder 10 3) -> 1 余数

(define lower 1)
(define upper 100)
(define (guess)
  (quotient (+ lower upper) 2))
(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))
(define (bigger)
  (set! lower (min upper (add1 (guess))))
  (guess))
(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))
#;(start 1 30)
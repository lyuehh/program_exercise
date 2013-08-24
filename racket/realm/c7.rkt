#lang racket
(define (my-map f lst)
  (cond [(empty? lst) empty]
        [else (cons (f (first lst))
                    (my-map f (rest lst)))]))

(define (my-filter f lst)
  (cond [(empty? lst) empty]
        [(f (first lst))
         (cons (first lst) (my-filter f (rest lst)))]
        [else (my-filter f (rest lst))]))

(define (my-foldr f base lst)
  (cond [(empty? lst) base]
        [else (f (first lst) (my-foldr f base (rest lst)))]))

(define (my-foldl f base lst)
  (cond [(empty? lst) base]
        [else (my-foldl f (f (first lst) base) (rest lst))]))
        
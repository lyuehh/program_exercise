(define (addn s) (lambda x (+ x s)))

(define (add1 s) ((addn 1) s))
